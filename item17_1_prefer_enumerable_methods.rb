require 'set'
# Enumerable
# Mixin in the Ruby standard library
# Gives a number of standard traversal methods
# One can save a lot of time by using enumerable methods
# zip: Called on one enumerable with another
# [1,2,3].zip([2,3,4]) => [[1,2], [2,3], [3,4]]
# each_with_index: [1,2,3].each_with_index produce => [[1, 0], [2, 1], [3,2]]
# a new enumerable that yield elements from the enumerable with their indices
# Useful for measuring progress
a = [1,2,3]
b = [3,4,5]
p a.zip(b)
p a.lazy.zip(b)
longer = [1,2,3,4,5]
p longer.zip(a) #=> [[1,1], [2,2], [3,3], [4,nil], [5,nil]]
p a.zip(longer) #=> [[1,2], [2,2], [3,3]]
b = Set.new([1,2,3,8])
p a.zip(b) #=> [[1,1], [2,2], [3,3]]
p b.zip(a)
a_hash = {a: 1, b: 2, c: 3}
p a.zip(a_hash) #=> [[1, [:a, 1]], [2, [:b, 2]], [3, [:c, 3]]]
a.zip(a_hash).each do |item|
  puts item
end

collection = [17, 19, 12, 31]
collection.each_with_index do |value, index|
  p value, index
end
collection = Set.new([18,28, 38, 48, 58, 68, 78,78])
p collection
collection.each_with_index do |value, index|
  p value, index
end
hash = {a: 1, b: 2, c: 3}
hash.each_with_index do |value, index|
  p value, index
end
