#
# Cookbook Name:: machine
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

yum_package 'httpd' do
  action :install
end

service 'httpd' do
  action [ :start, :enable]
end


yum_package 'openldap-servers' do
  action :install
end

service 'slapd' do
  action [ :start, :enable]
end

yum_package 'openldap-clients' do
  action :install
end

yum_package 'epel-release' do
  action :install
end

yum_package 'phpldapadmin' do
  action :install
end

template '/etc/httpd/conf.d/phpldapadmin.conf' do
  action :create
  source 'phpldapadmin.conf.erb'
  backup 10
end
