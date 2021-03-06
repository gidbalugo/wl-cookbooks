#
# Cookbook Name:: wlactivemq
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

tmp = Chef::Config[:file_cache_path]
version = node['activemq']['version']
mirror = node['activemq']['mirror']
activemq_home = "#{node['activemq']['home']}/apache-activemq-#{version}"

directory node['activemq']['home'] do
  recursive true
end

unless File.exists?("#{activemq_home}/bin/activemq")
  remote_file "#{tmp}/apache-activemq-#{version}-bin.tar.gz" do
    source "#{mirror}/activemq/#{version}/apache-activemq-#{version}-bin.tar.gz"
    mode "0644"
  end

  execute "tar zxf #{tmp}/apache-activemq-#{version}-bin.tar.gz" do
    cwd node['activemq']['home']
  end
end

file "#{activemq_home}/bin/activemq" do
  owner "root"
  group "root"
  mode "0755"
end

# TODO: make this more robust
arch = (node['kernel']['machine'] == "x86_64") ? "x86-64" : "x86-32"

link "/etc/init.d/activemq" do
  to "#{activemq_home}/bin/linux-#{arch}/activemq"
end

ruby_block "retrieve hostname of host activemq" do
    block do
        #tricky way to load this Chef::Mixin::ShellOut utilities
        #Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)  
        output = `hostname -I`
        ouputResult = output.to_s.strip
        node.override['activemq']['hostname'] = ouputResult
    end

    action :create
end

template "activemq.xml" do
  source "activemq.xml.erb"
  mode "0755"
  path "#{activemq_home}/conf/activemq.xml"
  action :create
end

service "activemq" do
  supports  :restart => true, :status => true
  action [:enable, :start]
end

# I DON'T UNDERSTAND WHAT IS THE USE OF THIS :D
#symlink so the default wrapper.conf can find the native wrapper library


