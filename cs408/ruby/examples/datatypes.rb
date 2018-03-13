#!/usr/bin/ruby

h = { :name => "Jane", :age => 17 }

p true.class, false.class
puts "String".class
puts 1.class
puts 1.class.superclass
puts 1.class.superclass.superclass
puts 4.3.class
puts 4.3.class.superclass
puts nil.class
puts h.class
puts :symbol.class
puts [].class
puts (1..8).class
