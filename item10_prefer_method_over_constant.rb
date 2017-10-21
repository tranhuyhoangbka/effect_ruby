# Constants
# Not necessarily constant
# Shared and global
# Cannot be replace with behaviour later
# Method 
# Can new up a data structure each time
# Local to an object, but can be made avaiable global
# Easily replaced with behaviour later

class Sample
  FOOS = [1,2,3]

  def does_something_with_foos
    foos.select!{|item| item % 2 == 0}
  end

  def foos
    [1,2,3]
  end
end

c = Sample.new
p Sample::FOOS
p c.does_something_with_foos
p c.foos

