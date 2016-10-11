#
# Cookbook Name:: wljava
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
# copied from java_se '8.102.1'

if node['wljava']['skip']
  Chef::Log.warn('Skipping install of Java SE!')
else
  case node['platform_family']
  when 'mac_os_x'
    include_recipe 'wljava::_macosx_install'
  when 'windows'
    include_recipe 'wljava::_windows_install'
  else
    include_recipe 'wljava::_linux_install'
  end
end
