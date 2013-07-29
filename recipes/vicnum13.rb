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
# Recipe:: vicnum13
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

mysql_database "Create results table" do
  connection mysql_connection_info
  database_name "vicnum"
  sql "create table results (idnum int(4) NOT NULL auto_increment PRIMARY KEY, name char(100), guess int(3) ZEROFILL, count int(2), tod TIMESTAMP );"
  action :query
end

mysql_database "Grant root user" do
  connection mysql_connection_info
  sql "grant all on *.* to root@localhost IDENTIFIED BY 'vicnum';"
  action :query
end
