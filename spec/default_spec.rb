# -*- coding: utf-8 -*-

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'vicnum' }

require 'chef/application'

describe 'vicnum::default' do
  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  context 'all version' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache',
                               step_into: ['vicnum_db']) do |node|
        node.set['vicnum']['version'] = '1.0'
        node.set['vicnum']['path'] = '/opt/vicnum-app'
      end.converge(described_recipe)
    end

    it 'should include required recipes for webapp' do
      expect(subject).to include_recipe('apache2')
      expect(subject).to include_recipe('php')
      expect(subject).to include_recipe('php::module_mysql')
      expect(subject).to include_recipe('apache2::mod_php5')
      expect(subject).to include_recipe('apache2::mod_perl')
    end

    it 'should install libmysqlclient-dev package' do
      expect(subject).to install_package('libmysqlclient-dev')
    end

    it 'should install mysql2 gem package' do
      expect(subject).to install_gem_package('mysql2')
    end

    it 'should download vicnum archive' do
      expect(subject).to create_remote_file('/var/chef/cache/vicnum.tar')
        .with(source: 'http://downloads.sourceforge.net/project/vicnum/1.0/1.0.tar')
    end

    it 'should create directory for vicnum application' do
      expect(subject).to create_directory('/opt/vicnum-app')
        .with(recursive: true)
    end

    it 'should untar vicnum archive in created directory' do
      expect(subject).to run_execute('untar-vicnum')
        .with(cwd: '/opt/vicnum-app',
              command: 'tar xf /var/chef/cache/vicnum.tar')
    end

    it 'should setup vicnum database' do
      expect(subject).to create_vicnum_db('vicnumdb')
    end

    it 'should setup mysql service' do
      expect(subject).to create_mysql_service('default')
        .with(port: '3306',
              version: '5.5',
              initial_root_password: 'vicnum')
    end

    it 'should drop vicnum database' do
      expect(subject).to drop_mysql_database('drop-vicnum-db')
        .with(database_name: 'vicnum',
              connection: { host: 'localhost',
                            username: 'root',
                            password: 'vicnum',
                            socket: '/run/mysql-default/mysqld.sock' })
    end

    it 'should create vicnum database' do
      expect(subject).to create_mysql_database('create-vicnum-db')
        .with(database_name: 'vicnum',
              connection: { host: 'localhost',
                            username: 'root',
                            password: 'vicnum',
                            socket: '/run/mysql-default/mysqld.sock' })
    end

    it 'should populate vicnum database' do
      expect(subject).to query_mysql_database('populate-vicnum-db')
        .with(database_name: 'vicnum',
              connection: { host: 'localhost',
                            username: 'root',
                            password: 'vicnum',
                            socket: '/run/mysql-default/mysqld.sock' })
    end
  end

  context 'version 1.5' do
    let(:subject) do
      ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache',
                               step_into: ['vicnum_db']) do |node|
        node.set['vicnum']['version'] = 'vicnum15'
        node.set['vicnum']['path'] = '/opt/vicnum-app'
      end.converge(described_recipe)
    end

    it 'should download vicnum archive' do
      expect(subject).to create_remote_file('/var/chef/cache/vicnum.tar')
        .with(source: 'http://downloads.sourceforge.net/project/vicnum/vicnum15/vicnum15.tar')
    end

    it 'should create sql temporary directory' do
      expect(subject).to create_directory('create-sql-dir')
        .with(path: '/opt/vicnum-app/sql')
    end

    it 'should copy sql dump file in temp directory' do
      expect(subject).to create_cookbook_file('/opt/vicnum-app/sql/install.sql')
        .with(source: 'vicnum15.sql')
    end

    it 'should populate vicnum database with mysql dump' do
      expect(subject).to run_execute('import-mysql-dump')
        .with(command: 'mysql -h localhost -u root -pvicnum '\
                       '--socket /run/mysql-default/mysqld.sock '\
                       'vicnum < /opt/vicnum-app/sql/install.sql')
    end
  end
end
