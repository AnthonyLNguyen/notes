class Test
 def initialize x
   @x = x
 end

 def +(y)
   @x + y
 end
end

a = Test.new 5
puts(a + 3)

a += 7
puts a
