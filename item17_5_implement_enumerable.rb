# A standard library module
# provide all the methods I've shown you and more
# can be included/excluded on to any class/object
# require you to implement #each(&blk) which calls 
# the block with each successive element of the collection
class StaticCollection
  include Enumerable
  def each(&blk)
    blk.call(1)
    blk.call(2)
    blk.call(3)
  end
end
StaticCollection.new.each do |i|
  p i
end

p StaticCollection.new.select{|i| i.even?}

class DynamicCollection
  include Enumerable

  def each(&blk)
    10.times do 
      blk.call(rand)
      sleep(rand*0.1)
    end
  end
end

p DynamicCollection.new.reduce(:+)
p DynamicCollection.new.select{|x| x< 0.99}
