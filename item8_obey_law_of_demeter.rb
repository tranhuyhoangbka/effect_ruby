# the law of Demeter
# Calling methods on nested objects
# for example foo.bar.baz.qux
# Exceptions for self, or objects of same type
# for example [1,2,3].map(&:to_s).map(&:upcase)
# "Dot chaining" indicates structural coupling
# refactoring to Demeter
# Most commonly refactor via delegation
# Possibly extract objects
# Sometimes implement nil checking 

Weather = Struct.new(:description)
City = Struct.new(:weather) do
  def weather_description
    weather.description
  end
end
Address = Struct.new(:city) do
  def weather
    city.weather_description
  end
end

Job = Struct.new(:address) do
  def weather
    address.weather
  end
end

j = Job.new(Address.new(City.new(Weather.new("Cloudy"))))
p j.weather

p "===================***====================="

items = [1,2,3,4,5]
class MapsAndSelects
  def initialize value
    @value = value
  end

  def mapped_value
    ((value + 1) * 20).to_s
  end

  def will_be_selected
    (value + 1).even? && mapped_value.length < 3
  end

  private
  attr_reader :value
end

p items.map{|item| MapsAndSelects.new(item)}.select(&:will_be_selected).map(&:mapped_value)
