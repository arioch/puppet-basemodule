# Puppet basemodule

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)
* Puppetlabs [apt module](https://github.com/puppetlabs/puppetlabs-apt) or
* Camptocamp [apt module](https://github.com/camptocamp/puppet-apt)

## Tested on...

* Debian 5 (Lenny)
* Debian 6 (Squeeze)
* CentOS 5
* CentOS 6

## Example usage

### Use case 1

    node /box/ {
      include basemodule
    }


### Manage repository

    node /box/ {
      class {
        'basemodule': manage_repo => true;
      }
    }


### Use case 2

    node /box/ {
      class {
        'basemodule':;
      }
    }

