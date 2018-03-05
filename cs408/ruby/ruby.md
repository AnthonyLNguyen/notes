# Ruby

## Features of Ruby
* Ruby is primarily an object-oriented programming language but also supports imperative and functional paradigms.
* Purely interpreted language.
* Ruby employs dynamic typing.
* Clean and intuitive syntax.

## Data Types

* Because everything in Ruby is an object, there are no primitive data types.
* Ruby has 8 primary data types and 3 derived from the Numeric superclass.
```Ruby

h = { :name => "Jane", :age => 17 }

puts true.class, false.class
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


STDOUT:
TrueClass
FalseClass
String
Integer
Numeric
Object
Float
Numeric
NilClass
Hash
Symbol
Array
Range
```

## Scoping

* Statically scoped

| Name Begins with  | Variable Scope        |
|:------------------|:----------------------|
|`$`                |A global variable      |
|`@`                |An instance variable   |
|`[a-z]` or `_`     |A local variable       |
|`[A-Z]`            |A constant             |
|`@@`               |A class variable       |

```Ruby
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

STDOUT:
global-variable
instance-variable
local-variable
constant
class variable

```

## Objects
* In Ruby, everything is an object - integers, characters, text, arrays - everything.
* Objects interact with another using method calling with a (`.`) after the object.
Example:
```Ruby
2.even?

STDOUT:
true
```

## Exceptions
### begin - rescue - end
```Ruby
def ex
    raise Exception.new("Test exception")
end

begin
    ex
    puts "This line won't print"
rescue Exception
    puts "Exception rescued!"
ensure
    puts "This line prints no matter what"
end

STDOUT:
Exception rescued!
This line prints no matter what

```

## Methods
* Can look up all the methods of an object using `methods` and the `sort` command to sort them.
Example
```Ruby
2.methods.sort

STDOUT:
[:!, :!=, :!~, :%, :&, :*, :**, :+, :+@, :-, :-@, :/, :<, :<<, :<=, :<=>, :==, :===, :=~, :>, :>=, :>>, :[], :^, :__id__, :__send__, :`, :abs, :abs2, :acts_like?, :ago, :angle
...

```

* Methods can also have arguments
```Ruby
['rock','paper','scissors'].index('paper')

STDOUT:
1
```
* Since everything in an object in Ruby, mathematical operators can also be invoked using methods. Of course, Ruby makes an exception in its syntactic rules for commonly used operators so you don't have to use periods to invoke them on objects.
```Ruby
2.+(4) # these are the same
2 + 4

SDTOUT:
6
6
```

## Strings

### String Interpolation

```Ruby
a = 1
b = 4
puts "The number #{a} is less than #{b}"
```

* Any valid block of Ruby code you place inside #{} will be evaluated and inserted at that location.

### Useful Methods
* `include?`
* `start_with?`
* `ends_with?`
* `index`
* `downcase`
* `swapcase`
* `split`
* `concat` or `+`
* `sub` and `gsub`
* `match`

## Control Structures

### if..else

```Ruby
def check_sign(number)
  if number == 0
    number
  elsif number > 0
    "#{number} is positive"
  else
    "#{number} is negative"
  end        
end        
```

* Also can use `unless x` which is equivalent to `if !x`

* You can put the if statement after the body.
```Ruby
a = true
puts "a is true" if a == true

```
is equivalent to
```Ruby
a = true
if a == true
    puts "a is true"
end
```
#### Truth
* Only `false` and `nil` equate to false in Ruby. Objects such as `1`, `0`, `""` are considered to be `true`



### Loops

* `loop` will loop until `break`
```Ruby
loop do
    a.next # increments a by 1
    break if a == 100
end
```
* `times` will allows us to loop a certain amount of times
```Ruby
3.times do
    puts "Hello World"
end

SDTOUT:
Hello World
Hello World
Hello World
```

## Arrays

### Array Methods
* The `map` method is used to transform the contents of an array

```Ruby
[1, 2, 3, 4, 5].map { |i| i + 1 }

STDOUT:
[2, 3, 4, 5, 6]
```

* `select` can be usd to filter elements of an Array
```Ruby
[1,2,3,4,5,6].select {|number| number % 2 == 0}

STDOUT:
[2, 4, 6]
```

* `delete` is used to delete elements

```Ruby
[1,3,5,4,6,7].delete 5 # Deletes the number 5
[1,2,3,4,5,6,7].delete_if{|i| i < 4 } # Deletes all greater than 4
```

* `for` loops and `each` loops

```Ruby
array = [1, 2, 3, 4, 5]

for i in array
  puts i
end

array.each do |i|
  puts i
end

STDOUT:
1
2
3
4
5
```

### Hashes

```Ruby
salaries = {
"Bob" => 69000,
"Jack" => 82000,
"John" => 120000
}

puts salaries["Jack"]

STDOUT:
82000
```

## Classes
* Ruby allows one to define classes of objects.
* No multiple inheritance.
* To look up an objects class use the `class` method
* To ask an object if it is a certain class use the `is_a?` method

```
puts 2.class
puts 2.is_a?(Integer)

STDOUT:
Integer
true
```
### Class Example
```Ruby
class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
  def area
    @length * @breadth
  end
end
```

## Inheritance
* No multiple inheritance

```Ruby
class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    super + " by flying"
  end
end

puts Animal.new.move
puts Bird.new.move

STDOUT:
I can move
I can move by flying
```

## Methods

```Ruby
def square(num)
    num ** 2
end
sq(3)

STDOUT:
9
```


```Ruby
def add(*numbers)
  numbers.inject(0) { |sum, number| sum + number }
end

puts add(1)
puts add(1, 2)
puts add(1, 2, 3)
puts add(1, 2, 3, 4)

STDOUT:
1
3
6
10
```
### Operater overloading
```Ruby
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

STDOUT:
8
12

```


### Lambdas

* Set a variable to a lambda function

```Ruby
s = lambda do |num|
    num ** 2
end

puts s.call(3)

STDOUT:
9
```
