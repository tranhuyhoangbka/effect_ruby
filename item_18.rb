require 'set'

class Role
  def initialize name, permissions
    @name, @permissions = name, Set.new(permissions)
  end

  def can? permission
    @permissions.include? permission
  end
end
AKIAION4AB2EUI3BQBHA
ky3e7sTrlRg0+Gg65CYRETTI/HsbQ3+d7CuxWC/j