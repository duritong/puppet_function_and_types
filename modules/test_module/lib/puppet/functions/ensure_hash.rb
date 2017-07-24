Puppet::Functions.create_function(:ensure_hash) do

  dispatch :ensure_hash do
    param 'Variant[String, Numeric]', :key
  end

  def ensure_hash(key)
    ## the next 2 variants do not match a possible lookup call
    #call_function('lookup', [key, Hash, 'hash',{}])
    #call_function('lookup', [key, 'Hash', 'hash',{}])
    #
    # Error: Evaluation Error: Error while evaluating a Function Call, 'lookup' expects one of:
    #  (NameType = Variant[String, Array[String]] name, ValueType = Type value_type?, MergeType = Variant[String[1, default], Hash[String, Scalar]] merge?)
    #    rejected: parameter 'name' variant 0 expects a NameType = Variant[String, Array[String]] value, got Tuple
    #    rejected: parameter 'name' variant 1 index 1 expects a NameType = Variant[String, Array[String]] value, got Type
    #    rejected: parameter 'name' variant 1 index 3 expects a NameType = Variant[String, Array[String]] value, got Hash
    #  (NameType = Variant[String, Array[String]] name, Optional[ValueType] value_type, Optional[MergeType] merge, DefaultValueType = Any default_value)
    #    rejected: expects 4 arguments, got 1
    #  (NameType = Variant[String, Array[String]] name, ValueType = Type value_type?, MergeType = Variant[String[1, default], Hash[String, Scalar]] merge?)
    #    rejected: parameter 'name' variant 0 expects a NameType = Variant[String, Array[String]] value, got Tuple
    #    rejected: parameter 'name' variant 1 index 1 expects a NameType = Variant[String, Array[String]] value, got Type
    #    rejected: parameter 'name' variant 1 index 3 expects a NameType = Variant[String, Array[String]] value, got Hash
    #  (OptionsWithName = Struct[{'name' => NameType = Variant[String, Array[String]], 'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] options_hash, BlockType = Callable[NameType = Variant[String, Array[String]]] block?)
    #    rejected: parameter 'options_hash' expects an OptionsWithName = Struct[{'name' => NameType = Variant[String, Array[String]], 'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] value, got Tuple
    #  (Variant[String, Array[String]] name, OptionsWithoutName = Struct[{'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] options_hash, BlockType = Callable[NameType = Variant[String, Array[String]]] block?)
    #    rejected: expects 2 arguments, got 1 at /tmp/puppet_function_and_types/manifests/site.pp:2:8 on node 
    #
    #
    # or
    #
    # Error: Evaluation Error: Error while evaluating a Function Call, 'lookup' expects one of:
    #  (NameType = Variant[String, Array[String]] name, ValueType = Type value_type?, MergeType = Variant[String[1, default], Hash[String, Scalar]] merge?)
    #    rejected: parameter 'name' variant 0 expects a NameType = Variant[String, Array[String]] value, got Tuple
    #    rejected: parameter 'name' variant 1 index 3 expects a NameType = Variant[String, Array[String]] value, got Hash
    #  (NameType = Variant[String, Array[String]] name, Optional[ValueType] value_type, Optional[MergeType] merge, DefaultValueType = Any default_value)
    #    rejected: expects 4 arguments, got 1
    #  (NameType = Variant[String, Array[String]] name, ValueType = Type value_type?, MergeType = Variant[String[1, default], Hash[String, Scalar]] merge?)
    #    rejected: parameter 'name' variant 0 expects a NameType = Variant[String, Array[String]] value, got Tuple
    #    rejected: parameter 'name' variant 1 index 3 expects a NameType = Variant[String, Array[String]] value, got Hash
    #  (OptionsWithName = Struct[{'name' => NameType = Variant[String, Array[String]], 'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] options_hash, BlockType = Callable[NameType = Variant[String, Array[String]]] block?)
    #    rejected: parameter 'options_hash' expects an OptionsWithName = Struct[{'name' => NameType = Variant[String, Array[String]], 'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] value, got Tuple
    #  (Variant[String, Array[String]] name, OptionsWithoutName = Struct[{'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] options_hash, BlockType = Callable[NameType = Variant[String, Array[String]]] block?)
    #    rejected: expects 2 arguments, got 1 at /tmp/puppet_function_and_types/manifests/site.pp:2:8 on

    # barfs on Hash.instance?
    #call_function('lookup', key, Hash, 'hash',{})
    #
    # Error: Evaluation Error: Error while evaluating a Function Call, undefined method `instance?' for Hash:Class
    # Did you mean?  instance_of? at /tmp/puppet_function_and_types/manifests/site.pp:2:8 on node
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/types/type_asserter.rb:33:in `assert_instance_of'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/lookup.rb:82:in `assert_type'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/lookup.rb:32:in `block in lookup'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/lookup.rb:29:in `each'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/lookup.rb:29:in `reduce'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/lookup.rb:29:in `lookup'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/loader/../../../puppet/functions/lookup.rb:209:in `do_lookup'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/loader/../../../puppet/functions/lookup.rb:193:in `lookup_2'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/dispatch.rb:60:in `invoke'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/dispatcher.rb:43:in `block in dispatch'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/dispatcher.rb:42:in `catch'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/dispatcher.rb:42:in `dispatch'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/function.rb:46:in `block in call'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/function.rb:45:in `catch'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/function.rb:45:in `call'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/function.rb:116:in `block in internal_call_function'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/util/profiler/around_profiler.rb:58:in `profile'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/util/profiler.rb:51:in `profile'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/function.rb:115:in `internal_call_function'
    # /home/duritong/.gem/ruby/gems/puppet-5.0.1/lib/puppet/pops/functions/function.rb:74:in `call_function'
    # /tmp/puppet_function_and_types/modules/test_module/lib/puppet/functions/ensure_hash.rb:46:in `ensure_hash'


    # barfs on 'Hash' not being a type so does not match a possible lookup call
    #call_function('lookup', key, 'Hash', 'hash',{})
    #
    # Error: Evaluation Error: Error while evaluating a Function Call, 'lookup' expects one of:
    #  (NameType = Variant[String, Array[String]] name, ValueType = Type value_type?, MergeType = Variant[String[1, default], Hash[String, Scalar]] merge?)
    #    rejected: expects between 1 and 3 arguments, got 4
    #  (NameType = Variant[String, Array[String]] name, Optional[ValueType] value_type, Optional[MergeType] merge, DefaultValueType = Any default_value)
    #    rejected: parameter 'value_type' expects a value of type Undef or ValueType = Type, got String
    #  (NameType = Variant[String, Array[String]] name, ValueType = Type value_type?, MergeType = Variant[String[1, default], Hash[String, Scalar]] merge?)
    #    rejected: expects between 1 and 3 arguments, got 4
    #  (OptionsWithName = Struct[{'name' => NameType = Variant[String, Array[String]], 'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] options_hash, BlockType = Callable[NameType = Variant[String, Array[String]]] block?)
    #    rejected: expects 1 argument, got 4
    #  (Variant[String, Array[String]] name, OptionsWithoutName = Struct[{'value_type' => Optional[ValueType = Type], 'default_value' => DefaultValueType = Any, 'override' => Optional[Hash[String, Any]], 'default_values_hash' => Optional[Hash[String, Any]], 'merge' => Optional[MergeType = Variant[String[1, default], Hash[String, Scalar]]]}] options_hash, BlockType = Callable[NameType = Variant[String, Array[String]]] block?)
    #    rejected: expects 2 arguments, got 4 at /tmp/puppet_function_and_types/manifests/site.pp:2:8 on node 

    # the only way how it works but does not enforce ValueType
    call_function('lookup', key, nil, 'hash',{})
  end
end
