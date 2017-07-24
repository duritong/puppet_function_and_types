# Demonstrating a problem with puppet types & function calling

This repository shows a problem I had while implementing a much more complex function.

The basic idea is that I want to lookup other values in a function and using the full potential of puppet's data type system.

However:

* calling a function seems to be different than document in https://docs.puppet.com/puppet/5.0/functions_ruby_implementation.html#calling-other-functions
* I'm unable to specify the ValueType Hash for the lookup.

See [modules/test_module/lib/puppet/functions/ensure_hash.rb](modules/test_module/lib/puppet/functions/ensure_hash.rb) for a simple implementation.

Run this example with:

    puppet apply --hiera_config hiera.yaml --modulepath=modules/ manifests/


