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

require 'serverspec'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/apache2/sites-available/vicnum.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe file('/etc/apache2/sites-enabled/vicnum.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_linked_to '/etc/apache2/sites-available/vicnum.conf' }
end

describe file('/opt/vicnum') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

# TODO: /opt/vicnum/sql should not exists
