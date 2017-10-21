# Instance variables
# State of an object
# Only accessible without behaviour
# Have no access or write time validation
# "Special" syntax for accessing
# Preferring Methods
# Trivial case can be implemented with a protected attr_accessor
# Behaveiour can be retrofitted over the accessor method later as necessary

class ValidateArrays
  def initialize array
    @array = array
  end

  def valid?
    array.any?{|x| x == 1}
  end

  private
  def array
    @array ||= []
  end
end

v = ValidateArrays.new nil
p v.valid?
p "==============*******================"
class Factory
  def make
    "I am result number #{n}".tap {
      self.n += 1
    }
  end

  protected
  attr_writer :n

  def n
    @n ||= 0
  end
end

f = Factory.new
p f.make
p f.make
p f.make

p f.make

