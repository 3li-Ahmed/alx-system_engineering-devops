#!/usr/bin/pup
# Install a specific version of flask (2.2.5)
package {'flask':
        ensure   => '2.2.5',
        provider => 'pip'
}