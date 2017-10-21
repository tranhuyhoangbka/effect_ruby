# symbol to proc
# We can call methods that take block like this:
# [1,2,3].map(&:to_s)
# == [1,2,3].map{|x| x.to_s}
# Send the named method to first argument sent to the block
a = [1,2,3,4]
p a.map(&:to_s)
p a.map(&:even?)
p a.partition(&:even?)

def method_that_take_a_block(&blk)
  p blk.call("hello")
  p blk.call("World!")
end

p method_that_take_a_block(&:upcase)
