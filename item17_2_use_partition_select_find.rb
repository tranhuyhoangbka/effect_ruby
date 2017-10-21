# each_slice and each_cons
# Methods for grouping elements from a enumable
# Useful when you need the previous/next element, or to
# iterate an array in consecutive slices
# each_slice Called on an enumerable with a slice size
# [1,2,3,4,5,6].each_slice(2) -> [[1,2], [3,4], [5,6]]
# each_cons called on enumerable with a slice size
# [1,2,3,4,5,6].each_cons(2) -> [[1,2], [2,3], [3,4], [4,5], [5, 6]]
require "set"
a = [1,2,3,4,5,6,7,8]
p a.each_slice(2).to_a
a.each_slice(2) do |i|
  p i
end
s = Set.new((1...18))
s.add(3)
s.add(3)
p s
s.each_slice(3) do |i|
  p i
end
h = {a: 1, b: 2, c:3}
h.each_slice(2) do |slice|
  p slice
end
p a.each_cons(2).to_a
s = Set.new([18,23,24,19,0])
s.each_cons(2) do |i|
  p i
end
