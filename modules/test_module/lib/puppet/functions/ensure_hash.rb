Puppet::Functions.create_function(:ensure_hash) do

  dispatch :ensure_hash do
    param 'Variant[String, Numeric]', :key
  end

  def ensure_hash(key)
    ## the next 2 variants do not match a possible lookup call
    #call_function('lookup', [key, Hash, 'hash',{}])
    #call_function('lookup', [key, 'Hash', 'hash',{}])

    # barfs on Hash.instance?
    #call_function('lookup', key, Hash, 'hash',{})

    # barfs on 'Hash' not being a type so does not match a possible lookup call
    #call_function('lookup', key, 'Hash', 'hash',{})

    # the only way how it works
    call_function('lookup', key, nil, 'hash',{})
  end
end
