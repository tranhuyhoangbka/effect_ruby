# Avoid using class methods
# Are not stateful
# Are harder to refactor
# May indicate
# A missing object, incorrect located behaviour, leaky implemention details
# instance method: manipulate and work with instance state
# Easy to refactor
class Foo
  def self.process some_data
    produre_1(some_data)
    produre_2(some_data)
  end

  def self.produre_1 some_data
    some_data.pop
  end

  def self.produre_2 some_data
    some_data << 18
  end
end

p Foo.process [1,2,3]

class Foo
  def initialize some_data
    @some_data = some_data
  end

  def process
    procedure_1
    procedure_2
  end

  private
  attr_reader :some_data

  def procedure_1
    some_data.pop
  end

  def procedure_2
    some_data << 18
  end
end

p Foo.new([1,2,3]).process
