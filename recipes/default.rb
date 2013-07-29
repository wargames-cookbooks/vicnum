# This source file is part of Vicnum's chef cookbook.
#
# Vicnum's chef cookbook is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Vicnum's chef cookbook is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with Vicnum's chef cookbook. If not, see <http://www.gnu.org/licenses/gpl-3.0.html>.
#
# Cookbook Name:: vicnum
# Recipe:: default
#

include_recipe "apache2"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_perl"

apache_site "default" do
    enable false
end

web_app "vicnum" do
  cookbook "vicnum"
  enable true
  docroot node["vicnum"]["path"]
  server_name node["vicnum"]["server_name"]
  server_aliases node["vicnum"]["server_aliases"]
end

# Vicnum Install
vicnum_dl_url = "http://sourceforge.net/projects/vicnum/files/" + node["vicnum"]["version"] + "/" + node["vicnum"]["version"] + ".tar/download"
vicnum_local = Chef::Config[:file_cache_path] + "/" + node["vicnum"]["version"] + ".tar"

remote_file vicnum_local do
  source vicnum_dl_url
  mode "0644"
end

directory node["vicnum"]["path"] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

execute "untar-vicnum" do
  cwd node['vicnum']['path']
  command "tar xf " + vicnum_local
end

case node["vicnum"]["version"]
when "vicnum13", "vicnum14"
  include_recipe "vicnum::vicnum13"
when "vicnum15"
  include_recipe "vicnum::vicnum15"
end
