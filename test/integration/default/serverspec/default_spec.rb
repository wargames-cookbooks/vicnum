require "spec_helper"

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe file("/etc/apache2/sites-available/vicnum.conf") do
  it { should be_file }
end

describe file("/etc/apache2/sites-enabled/vicnum.conf") do
  it { should be_file }
end

describe file("/opt/vicnum") do
  it { should be_directory }
end
