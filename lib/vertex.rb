class Vertex
  const SIZE = 8
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
end
