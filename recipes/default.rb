# -*- coding: utf-8 -*-
#
# Cookbook Name:: vicnum
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apache2'
include_recipe 'php'
include_recipe 'php::module_mysql'
include_recipe 'apache2::mod_php'
include_recipe 'apache2::mod_perl'

mysql2_chef_gem 'default' do
  package_version '5.5'
end

apache_site 'default' do
  enable false
end

web_app 'vicnum' do
  cookbook 'vicnum'
  enable true
  docroot node['vicnum']['path']
  server_name node['vicnum']['server_name']
  server_aliases node['vicnum']['server_aliases']
end

vicnum_dl_url = 'http://downloads.sourceforge.net/project/vicnum/'\
                "#{node['vicnum']['version']}/#{node['vicnum']['version']}.tar"
vicnum_local = "#{Chef::Config[:file_cache_path]}/vicnum.tar"

remote_file vicnum_local do
  source vicnum_dl_url
end

directory node['vicnum']['path'] do
  recursive true
end

execute 'untar-vicnum' do
  cwd node['vicnum']['path']
  command "tar xf #{vicnum_local}"
end

vicnum_db 'vicnumdb'
