# avoid using class variables
# Maintain state between object instants
# Are shared across inheritance boundaries
# can be difficult to debug
# Count as global mutable data
# So: Prefer instance variables
# Are necessarily new on each object instance
# Explicit state per object instance
# Are not global
class Foo
  @@b = 2

  def initialize
    @@b = 0
  end

  def bar 
    @@b += 1
    @@b
  end
end

f1 = Foo.new
f2 = Foo.new
p f1.bar
p f2.bar
p "=================*****************================"

@@a = 0

class Foo
  def self.b
    @@a += 1
  end

  def b
    @@a
  end
end

p Foo.b
p Foo.b
p Foo.b
p Foo.new.b

p "===============**************---------------"
class Bar
  @@a = 1

  def a
    @@a
  end
end

class Foo < Bar
  def a
    @@a = 3
  end
end
p Bar.new.a
p Foo.new.a