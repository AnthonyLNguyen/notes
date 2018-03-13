class Test
    $global = 1
    @instance = 2
    local = 3
    Constant = 4
    @@class = 5
    puts defined?($global)
    puts defined?(@instance)
    puts defined?(local)
    puts defined?(Constant)
    puts defined?(@@class)
end
