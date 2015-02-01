Vicnum Cookbook
=============
Deploy a vicnum environment.
[![Cookbook Version](https://img.shields.io/cookbook/v/vicnum.svg)](https://community.opscode.com/cookbooks/vicnum) [![Build Status](https://secure.travis-ci.org/wargames-cookbooks/vicnum.png)](http://travis-ci.org/wargames-cookbooks/vicnum)

Requirements
------------

#### Platform
- `Ubuntu 10.04`
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

#### Mysql configuration

Actually, you must setup mysql root password to `vicnum`.
```json
{
  "mysql": {
    "server_root_password": "vicnum"
  }
}
```

Attributes
----------

#### vicnum::default
* `['vicnum']['version']` - Vicnum version to deploy
* `['vicnum']['path']` - Path where application will be deployed
* `['vicnum']['server_name']` - Apache2 server name
* `['vicnum']['server_aliases']` - Array of apache2 virtualhost aliases

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
