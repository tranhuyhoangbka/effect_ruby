# method is a method on kernel so it is available to all objects
# return a method object which knows receiver and source location
# Take an instance method off the receiver and return it as a callable
# Allow us to follow the Object Oriented principle Give Your Objects Exactly What they need(GYOEWTN)
class ReallyComplexStringTransform
  def transform(string)
    a = string.upcase
    a += "jfojowewrposdaeqwaocbvnm"
    a[4] = "f"
    a
  end
end

strings = %w(single page web apps don't work)
t = ReallyComplexStringTransform.new.method(:transform)

strings.map(&t).each do |new_string|
  p new_string
end
