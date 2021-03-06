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

#default to 1
zookeeper_id = "1"

ruby_block "update myid based on private ip" do
    block do
        #tricky way to load this Chef::Mixin::ShellOut utilities
        #Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)  
        output = `hostname -I`
		ouputResult = output.to_s.strip

		if ouputResult == "#{node['zookeeper']['private1']}".to_s.strip
			node.override['zookeeper']['myid'] = "#{node['zookeeper']['id1']}"
			node.override['zookeeper']['private1']  = "0.0.0.0"

		elsif ouputResult == "#{node['zookeeper']['private2']}".to_s.strip
			node.override['zookeeper']['myid'] = "#{node['zookeeper']['id2']}"
			node.override['zookeeper']['private2']  = "0.0.0.0"

		elsif ouputResult == "#{node['zookeeper']['private3']}".to_s.strip
			node.override['zookeeper']['myid'] = "#{node['zookeeper']['id3']}"
			node.override['zookeeper']['private3']  = "0.0.0.0"

		end
    end

    action :create
end

#update server id
template "myid" do
	source "myid.erb"
	mode "0755"
	path "#{zookeeper_dataDir}/myid"
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
	action :run
end