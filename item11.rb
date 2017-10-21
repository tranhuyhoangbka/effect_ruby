# Use the === protocol for matching tasks
# Universal "match" protocol in Ruby
# Lambdas, regexes, ranges, classes all implement it
# a === b asks "is b subsumed by a"
# implemented for free on all classes
# Allow you to swap the types of objects aginst which matches are performed
# For example, lambda for regex
p Object === []
p Array === []

class MyClass
end

m = MyClass.new
p MyClass === m
p MyClass === Object.new
p /ab/ === "babble"
p /ab/ === "fsdfsdfs"
p (1...8) === 3
p (1...8) === 0
p (1...8) === 19

class EmailMatcher
  def ===(other)
    other.split("@").count == 2 && 
      other.split("@").last.include?(".")
  end
end

class ValidatesEmails
  def initialize email
    @email = email
  end

  def valid?
    email_matcher === email
  end

  private
  attr_reader :email

  def email_matcher
    # /.*@.*.co/
    EmailMatcher.new
  end
end

p ValidatesEmails.new("bob@example.com").valid?
