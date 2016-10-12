#
# Cookbook Name:: wlzookeeper
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

tmp = Chef::Config[:file_cache_path]
version = node['zookeeper']['version']
mirror = node['zookeeper']['mirror']

zookeeper_dataDir = node['zookeeper']['dataDir']
zookeeper_home = "#{node['zookeeper']['home']}/zookeeper-#{version}"

directory node['zookeeper']['home'] do
	recursive true
end

unless File.exists?("#{zookeeper_home}/bin/zkServer.sh")
	remote_file "#{tmp}/zookeeper-#{version}.tar.gz" do
    source "#{mirror}/zookeeper/stable/zookeeper-#{version}.tar.gz"
    mode "0644"
end

execute "tar zxf #{tmp}/zookeeper-#{version}.tar.gz" do
	cwd node['zookeeper']['home']
	end
end

directory "/var/zookeeper" do
	mode '0755'
	action :create
end

ruby_block "update myid based on private ip" do
    block do
        #tricky way to load this Chef::Mixin::ShellOut utilities
        #Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)  
        output = `hostname -I`
        if output == node['zookeeper']['private1']
        	zookeeper_id = node['zookeeper']['id1']

        elsif output == node['zookeeper']['private2']
        	zookeeper_id = node['zookeeper']['id2']

        elsif output == node['zookeeper']['private3']
        	zookeeper_id = node['zookeeper']['id3']

        end
    end
    action :create
end

file "#{zookeeper_dataDir}/myid" do
	content "#{zookeeper_id}"
	mode "0755"
	action :create
end

#update zoo.cfg
template "zoo.cfg" do
	source "zoo.cfg.erb"
	mode "0755"
	path "#{zookeeper_home}/conf/zoo.cfg"
	action :create
end

# TODO: make this more robust
arch = (node['kernel']['machine'] == "x86_64") ? "x86-64" : "x86-32"

bash 'run_zookeeper' do
	cwd ::File.dirname("~")
	code <<-EOH
		#{zookeeper_home}/bin/zkServer.sh start
		EOH
	user "root"
end