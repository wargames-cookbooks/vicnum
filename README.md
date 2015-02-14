Vicnum Cookbook
=============
Deploy a vicnum environment.
[![Cookbook Version](https://img.shields.io/cookbook/v/vicnum.svg)](https://community.opscode.com/cookbooks/vicnum) [![Build Status](https://secure.travis-ci.org/wargames-cookbooks/vicnum.png)](http://travis-ci.org/wargames-cookbooks/vicnum)

Requirements
------------

#### Platform
- `Ubuntu 12.04`

#### Cookbooks
- `apache2` - https://github.com/opscode-cookbooks/apache2.git
- `mysql` - https://github.com/opscode-cookbooks/mysql.git
- `php` - https://github.com/opscode-cookbooks/php.git
- `database` - https://github.com/opscode-cookbooks/database.git

#### Supported versions
- `Vicnum 1.3`
- `Vicnum 1.4`
- `Vicnum 1.5`

Attributes
----------

#### vicnum::default
<table>
<tr>
<th>Key</th>
<th>Type</th>
<th>Description</th>
<th>Default</th>
</tr>
<tr>
<td><tt>['vincum']['version']</tt></td>
<td>String</td>
<td>Vicnum version to deploy</td>
<td><tt>vicnum15</tt></td>
</tr>
<tr>
<td><tt>['vicnum']['path']</tt></td>
<td>String</td>
<td>Path where application will be deployed</td>
<td><tt>/opt/vicnum</tt></td>
</tr>
<tr>
<td><tt>['vicnum']['server_name']</tt></td>
<td>String</td>
<td>Apache2 server name</td>
<td><tt>vicnum</tt></td>
</tr>
<tr>
<td><tt>['vicnum']['server_aliases']</tt></td>
<td>Array</td>
<td>Array of apache2 virtualhost aliases</td>
<td><tt>[vicnum]</tt></td>
</tr>
</table>

Usage
-----
#### vicnum::default

Just include `vicnum` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vicnum]"
  ]
}
```

#### Running tests

- First, install dependencies:  
`bundle install`

- Run Checkstyle and ChefSpec:  
`bundle exec rake`

- Run Kitchen tests:  
`bundle exec rake kitchen`  

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add-component-x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
