# # prefer decorating collections
# # collection Class in ruby have wide public intefer 
# # are partially implement in C
# # Do not always respect subclasses
# # Decoration is a technique for wraping another object
# # Allow you reduce the public interface
# class ArrayLike < Array

# end
# a = ArrayLike.new([1,2,3])
# p a
# p a.class
# p a == [1,2,3]
# p [1,2,3] == a
# reversed_a = a.reverse
# p reversed_a.class
# p "==========*****==========="

# class ArrayLike
#   def initialize somearray
#     @somearray = somearray.to_a.dup
#   end

#   def reverse
#     self.class.new somearray.reverse  
#   end

#   def to_a
#     somearray.dup
#   end

#   def inspect
#     "#<ArrayLike>:#{somearray.inspect}"
#   end

#   private
#   attr_reader :somearray
# end

# a = ArrayLike.new([1,2,3])
# p a
# a_reverse = a.reverse
# p a.reverse
# a = ArrayLike.new(a_reverse).reverse
# p a

# p "==============********=============="
require "delegate"

class ArrayLike < SimpleDelegator
  def contains_only_even_numbers?
    all?{|x| x%2 == 0}
  end
end
a = ArrayLike.new([1,2,3])
p a

a.each{|item| p item}
p a.reverse.class
p a.contains_only_even_numbers?

p "================**********=================="
require "forwardable"

class RaisingHash
  extend Forwardable
  include Enumerable

  def initialize hash
    @hash = hash
  end

  def_delegators(:@hash, :[], :[]=, :delete, :each,
    :keys, :values, :length, :empty?, :hash_key?)
end

r = RaisingHash.new(a: :b)
p r[:a]
p r[:b]
p r.respond_to? :include?