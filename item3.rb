# consider using a default hash value 
some_words = "Single page web apps don't work on the web"
result = {}
some_words.split(" ").each do |word|
  result[word] ||= 0
  result[word] += 1
end
p result
p "+=============+"

result = Hash.new 0
some_words.split(" ").each do |word|
  result[word] += 1
end
p result

p "+=============+"

result = Hash.new []
some_words.split(" ").each do |word, i|
  result[word] << i
end
p result
p "+=============+"

result = Hash.new { |hash, key| hash[key] = [] }
some_words.split(" ").each_with_index do |word, i|
  result[word] << i
end
p result
result = Hash.new
p result[:missing]
result[:missing] = 13
p result[:missing]
p Hash.new == {}
p Hash.new([]) == {}