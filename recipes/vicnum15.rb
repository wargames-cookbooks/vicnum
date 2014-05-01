# encoding: utf-8
#
# Cookbook Name:: vicnum
# Recipe:: vicnum15
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

include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "database"
include_recipe "mysql::ruby"

mysql_connection_info = {
  :host => "localhost",
  :username => "root",
  :password => "vicnum"
}

mysql_database "vicnum" do
  connection mysql_connection_info
  action :create
end

mysql_database "Grant root user" do
  connection mysql_connection_info
  sql "grant all on *.* to root@localhost IDENTIFIED BY 'vicnum';"
  action :query
end

mysql_database "Create tables" do
  connection mysql_connection_info
  database_name "vicnum"
  sql "create table results (idnum int(4) NOT NULL auto_increment PRIMARY KEY, name char(100), guess int(3) ZEROFILL, count int(2), tod TIMESTAMP );"
  action :query
end


directory node["vicnum"]["path"] + "/sql" do
  owner "root"
  group "root"
  mode  "0700"
  action :create
end

cookbook_file node["vicnum"]["path"] + "/sql/install.sql" do
  source "vicnum15.sql"
  cookbook "vicnum"
end

mysql_database "Setup database (#{@provider})" do
  connection mysql_connection_info
  database_name "vicnum"
  sql { ::File.open(node["vicnum"]["path"] + "/sql/install.sql").read }
  action :query
end


directory node["vicnum"]["path"] + "/sql" do
  action :delete
  recursive true
end
