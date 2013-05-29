# Puppet basemodule

## Requirements

* [concat](https://github.com/ripienaar/puppet-concat)
* [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)

Debian only:

* Puppetlabs [apt module](https://github.com/puppetlabs/puppetlabs-apt) or
* Camptocamp [apt module](https://github.com/camptocamp/puppet-apt)


## Tested on...

* Debian 5 (Lenny)
* Debian 6 (Squeeze)
* CentOS 5
* CentOS 6


## Example usage

### Install basemodule

    node /box/ {
      include basemodule
    }

### Configure basemodule

    node /box/ {
      class { 'basemodule':
        pkg_ensure     => latest,
        service_ensure => running,
      }
    }

### Manage repository

    node /box/ {
      class { 'basemodule':
        manage_repo => true,
      }
    }


## Development

### Run RSpec tests

    $ bundle exec rake spec

