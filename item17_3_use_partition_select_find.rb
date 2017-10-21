# partition, select, and find
# Methods for finding elements within enumerable
# variously  find individual/sets of elements that do/do not
# match predicates passed as block
# partition called on an enumerable with a block
# [1,2,3,4].partition{|x| x.even?}
# => 2 arrays, one with matching elements, one non-matching elements
# [[2,4], [1,3]]
# [1,2,3,4].select{|x| x.even?} => [2,4]
# reject opposite of select
# [1,2,3,4].reject{|x| x.even?} => [1,3]
# find return first matching element or nil
# [1,2,3,4].find{|x| x.even?} => 2
a = [1,2,3,4,5,6,7,8]
matches, does_not_match = a.partition{|x| x.even?}
p matches
require "set"
s = Set.new(["hello", "hello world", "world"])
matches, does_not_match = s.partition{|x| x.include?("world")}
p matches
p does_not_match
h = {a: 1, b: 2, c: 3}
matches, does_not_match = h.partition{|key, value| key == :a}
# => [[:a, 1]], [[:b, 2], [:c, 3]]
p matches
p does_not_match

a = [1,2,3,4,5,6,7,8]
a.select!{|x| x.even?}
p a #=> [2,4,6,8]
a = [1,2,3,4,5,6]
a.reject!{|x| x.even?}
p a # => [1,3,5]

h = {a: 1, b: 2, c: 3}
h.find{|key, value| value % 3 == 0}
# => [:c, 3]
