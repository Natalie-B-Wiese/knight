class Vertex
  SIZE = 8

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # returns true if this vertex is valid, false if the vertex is out of bounds
  def valid?
    return false if @x.negative? || @y.negative? || @x > (SIZE - 1) || @y > (SIZE - 1)

    true
  end

  # returns a new point that is shifted by an amount
  def shift_x(x_amount)
    @x += x_amount
  end

  def shift_y(y_amount)
    @y += y_amount
  end

  def shift_xy(x_amount, y_amount)
    shift_x(x_amount)
    shift_y(y_amount)
  end

  def ==(other)
    # Check if other is the same class and has same attributes
    if other.is_a?(Array) && other.length == 2
      @x = other[0] && @y == other[1]
    else
      return false unless other.is_a?(Vertex)

      @x == other.x && @y == other.y
    end
  end

  def eql?(other)
    self == other
  end
end
