# -*- coding: utf-8 -*-

require 'serverspec'
set :backend, :exec

describe service 'apache2' do
  it { should be_enabled }
  it { should be_running }
end

describe port 80 do
  it { should be_listening }
end

describe file '/etc/apache2/sites-available/vicnum.conf' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe file '/etc/apache2/sites-enabled/vicnum.conf' do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_linked_to '../sites-available/vicnum.conf' }
end

describe file '/opt/vicnum' do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe command 'wget -O - http://127.0.0.1' do
  its(:stdout) { should match(/Welcome to the Vicnum Game|Welcome to Vicnum/) }
end
