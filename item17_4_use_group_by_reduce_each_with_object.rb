# Methods for transforming collections into other 
# collections/values
# Offen used to produce a hash with keys/values from
# array
# group_by called on an enumerable with a block
# [1,2,3,4].group_by{|x| x.even?}  => {false=>[1, 3], true=>[2, 4]}
# produces a hash, keys are result of the predicate
# values are the values that produced the matching predicate result

# reduce called on an enumerable, with a default value and
# a block, [1,2,3].reduce(0){|accum, item| accum + item} => 6
# produce a result based on return value of the last invocation of the block

# each_with_object
# called on an enumerable with an object and a block
# [1,2,3].each_with_object({}){|x, o| o[x] = x.even?}
# => {1=>false, 2=>true, 3=>false} 
# return the passed object after the block is called with each element
a = [1,2,3,4,5,6,7]
a.group_by{|x| x % 3}
# {1=>[1, 4, 7], 2=>[2, 5], 0=>[3, 6]}
a.group_by{|x| x.even?}
# {false=>[1, 3, 5, 7], true=>[2, 4, 6]} 
a.reduce(:+) #=> 21
a.reduce(0, :+) # => 21
a.reduce(3, :+) # => 24
a.reduce(0, &:+)
a.reduce(0){|accum, item| accum + item} # => 21
a = ["some", "strings", "some", "more", "strings"]
a.reduce(Hash.new(0)) do |accum, value|
  accum[value] += 1
  accum
end
# => {"some"=>2, "strings"=>2, "more"=>1}

a.each_with_index.reduce(Hash.new{|h, k| h[k] = []}) do |accum, value_and_index|
  value, index = value_and_index
  accum[value] << index
  accum
end
# {"some"=>[0, 2], "strings"=>[1, 4], "more"=>[3]}

a = [1,2,3,4,5,6]
a.reduce([]) do |accum, item|
  if item.even?
    accum << item
  end
  accum
end
# => [2, 4, 6]

result = a.each_with_object(0) do |item, object|
  object += item
end
p result
# => 0

class Counter
  def increment n
    @count ||= 0
    @count += n
  end

  def count
    @count
  end
end

result = a.each_with_object(Counter.new) do |item, object|
  object.increment item
end.count
p result

s = ["some", "strings", "some", "more", "strings"]
result = s.each_with_object(Hash.new(0)) do |item, object|
  object[item] += 1
end
p result

