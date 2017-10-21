class ValidatesConstructorArguments
  def initialize potentially_invalid_array
    @potentially_invalid_array = potentially_invalid_array.dup
   raise ArgumentError.new("The passed array is invlid") unless array_valid?
  end

  def transform
    potentially_invalid_array.map{|x| x.upcase}.join(",")
  end

  private
  attr_reader :potentially_invalid_array

  def array_valid?
    potentially_invalid_array.all? do |x|
      String === x
    end
  end
end
#array = ["stringxxx", "string", "string"]
#vca = ValidatesConstructorArguments.new array
#array << 1
#vca.transform
#puts vca.send :array_valid?

class HashSelector
  def initialize hash
    @hash = hash.dup
  end

  def meaningful_keys
    hash.select!{|k,v| k == :valid}
  end

  private
  attr_reader :hash
end
hash = {valid: "tenda", invalid: "another value"}
hl = HashSelector.new hash
hl.meaningful_keys
puts hash

class RandomMatrix
  def initialize width, height
   @matrix = [] 
   height.times do |i|
     matrix << []
     width.times do
       matrix[i] << rand
     end
   end
  end

  def row i
    matrix[i].dup
  end

  private
  attr_reader :matrix
end

m = RandomMatrix.new 2, 3
m.row(2)[0] = 99999
puts m.row(2)
puts m.row(2)[0]
