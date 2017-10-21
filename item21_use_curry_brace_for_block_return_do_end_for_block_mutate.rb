# Use {} for block that return and do..end for blocks that mutable
# Both {} and do..end allow us to specify blocks
# Essentially syntactically equivalent
# Suggestion for consistency of style
# Use {} for blocks which are functional
# Use do..end for blocks that mutate system state

a = (1..5).to_a
a.each do |item|
  p item
end

rs = a.map{|item| item + 1}
p rs
rs = a.select{|item| item + 2}
p rs

result = a.each_with_object(Hash.new(0)) do |item, object|
  object[item] += 1
end
p result

result = a.reduce(Hash.new(0)){|accum, item|
  accum[item] += 1
  accum
}
p result
