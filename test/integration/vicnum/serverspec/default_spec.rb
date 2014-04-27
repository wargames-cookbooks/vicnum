require "spec_helper"

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe file(node["apache"]["dir"] + "/sites-available/vicnum.conf") do
  it { should be_file }
end

describe file(node["apache"]["dir"] + "/sites-enabled/vicnum.conf") do
  it { should be_file }
end

describe file(node["vicnum"]["path"]) do
  it { should be_directory }
end
