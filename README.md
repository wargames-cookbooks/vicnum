Vicnum Cookbook
=============
Deploy a vicnum environment.
[![Cookbook Version](https://img.shields.io/cookbook/v/vicnum.svg)](https://community.opscode.com/cookbooks/vicnum) [![Build Status](https://secure.travis-ci.org/wargames-cookbooks/vicnum.png)](http://travis-ci.org/wargames-cookbooks/vicnum)

Requirements
------------

#### Platform
- `Ubuntu 14.04`
- `Debian 8.7`

#### Cookbooks
- `apache2` - https://supermarket.chef.io/cookbooks/apache2
- `mysql` - https://supermarket.chef.io/cookbooks/mysql
- `php` - https://supermarket.chef.io/cookbooks/php
- `database` - https://supermarket.chef.io/cookbooks/database
- `mysql2_chef_gem` - https://supermarket.chef.io/cookbooks/mysql2_chef_gem

#### Supported versions
- `Vicnum 1.4`
- `Vicnum 1.5`

Attributes
----------

#### vicnum::default
| Key                                 | Type   |  Description                                                      |
| ----------------------------------- | ------- | ---------------------------------------------------------------- |
| `[vicnum][version]`                 | String  | Vicnum version to deploy (default: `vicnum15`)                   |
| `[vicnum][path]`                    | String  | Path where application will be deployed (default: `/opt/vicnum`) |
| `[vicnum][apache2][server_name]`    | String  | Apache2 server name (default: `vicnum`)                          |
| `[vicnum][apache2][server_aliases]` | Array   | Array of apache2 virtualhost aliases (default: `[vicnum]`)       |

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
