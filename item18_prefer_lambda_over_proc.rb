# proc
# Anonymous callable
# take a block
# Does not get a stack frame
# Does not validate arity

# lambda
# Anonymous callable
# take a block
# Does get a stack frame
# Does validate arity

# p = Proc.new{|arg_one, arg_two|
#   p arg_one
#   p arg_two
# }
# p.call(1) # => 1, nil
# p.call(1,2,3) # => 1,2

l = lambda{|arg_one, arg_two|
  p arg_one
  p arg_two
}

l.call(1,2)
# l.call(1,2,3) # raise error

def foo(&blk)
  p [:foo, 1]
  blk.call
  p [:foo, 2]
end

def bar(&blk)
  p [:bar, 1]
  foo(&blk)
  p [:bar, 2]
end

def baz
  p [:baz, 1]
  bar(&(lambda{return}))
  p [:baz, 2]
end
baz
#=> [:baz, 1], [:bar, 1], [:foo, 1]
def foo
  f = {}
  p f.fetch(:foo, &(lambda{|key| return}))
  p "here!"
end
foo
