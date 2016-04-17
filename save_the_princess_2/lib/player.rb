# Create player objects
class Player
  attr_accessor :y, :x

  def initialize(y = 0, x = 0)
    @y = y
    @x = x
  end
end
