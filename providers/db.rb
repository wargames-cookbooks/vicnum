# -*- coding: utf-8 -*-
#
# Cookbook Name:: vicnum
# Provider:: db
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

use_inline_resources

include Chef::DSL::IncludeRecipe

action :create do
  connection_info = {
    host: 'localhost',
    username: 'root',
    password: 'vicnum',
    socket: '/run/mysql-default/mysqld.sock',
  }

  mysql_service 'default' do
    port '3306'
    version '5.5'
    initial_root_password 'vicnum'
    action [:create, :start]
  end

  mysql_database 'drop-vicnum-db' do
    connection connection_info
    database_name 'vicnum'
    action :drop
  end

  mysql_database 'create-vicnum-db' do
    connection connection_info
    database_name 'vicnum'
  end

  mysql_database 'populate-vicnum-db' do
    connection connection_info
    database_name 'vicnum'
    sql 'create table results (idnum int(4) NOT NULL '\
        'auto_increment PRIMARY KEY, name char(100), guess int(3) ZEROFILL, '\
        'count int(2), tod TIMESTAMP );'
    action :query
  end

  if node['vicnum']['version'] == 'vicnum15'
    directory 'create-sql-dir' do
      path "#{node['vicnum']['path']}/sql"
    end

    cookbook_file "#{node['vicnum']['path']}/sql/install.sql" do
      source 'vicnum15.sql'
    end

    execute 'import-mysql-dump' do
      command 'mysql -h localhost -u root -pvicnum '\
              '--socket /run/mysql-default/mysqld.sock '\
              "vicnum < #{node['vicnum']['path']}/sql/install.sql"
    end
  end
end
