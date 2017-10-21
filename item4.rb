# Use Hatch##fetch over Hash##[]
# hash[key] send #[] method to hash object and return nil || default value if key missing
# hash.fetch(key) raise an exception if key is missing
# no implicit nil
# hash.fetch(key, default) return default value if key missing
# hash.fetch(key){|key| ...} evaluates the passed block passing the key if key is missing
a = {}
p a[:missing]
#a.fetch :missing
a[:some_key] = :value
p a.fetch :some_key
p a.fetch(:some_key){p "this block won't run"}
p a.fetch(:some_other_key){p "this block will run"}

class IsLikeAHash
  def [](key)
    {
      1 => :foo,
      2 => :bees
    }[key]
  end
end

l = IsLikeAHash.new
p l[1]

a = [1,2,3,4,5]
p a[2]
p a.fetch 2
p a.fetch 100, 9   => 9