Vicnum Cookbook
=============
Deploy a vicnum environment.

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
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['vicnum']['version']</tt></td>
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
    <td>String</td>
    <td>Array of apache2 virtualhost aliases</td>
    <td><tt>vicnum</tt></td>
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

- Run kitchen tests:  
`bundle exec kitchen test`  

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

License: See COPYING file.
