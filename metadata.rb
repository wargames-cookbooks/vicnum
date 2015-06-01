# -*- coding: utf-8 -*-
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

name 'vicnum'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache 2.0'
description 'Installs/Configures Vicnum application'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.3'

recipe 'default', 'Common configuration for vicnum application'
recipe 'vicnum13', 'Database configuration for vicnum 1.3 and 1.4'
recipe 'vicnum15', 'Database configuration for vicnum 1.5'

depends 'apache2'
depends 'mysql'
depends 'mysql2_chef_gem'
depends 'php'
depends 'database'

supports 'ubuntu'
supports 'debian'
