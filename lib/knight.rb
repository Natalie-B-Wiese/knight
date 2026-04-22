require_relative 'vertex'

def knight_moves(start_point, goal_point)
  path = []

  current_vertex = Vertex.new(start_point[0], start_point[1])

  path.push(current_vertex)

  leaves = valid_leaves(current_vertex, path)
  p leaves

  path
end

# returns an array of valid next points
# If a point apepars in reject_array, that point is excluded
def valid_leaves(current_point, reject_array)
  leaves_from_point(current_point).select(&:valid?).reject { |vertex| reject_array.include?(vertex) }
end

# returns an array of all 8 move places from point
# it includes invalid out of bounds vertices
def leaves_from_point(vector)
  [
    Vertex.new(vector.x + 1, vector.y + 2),
    Vertex.new(vector.x - 1, vector.y + 2),

    Vertex.new(vector.x + 2, vector.y + 1),
    Vertex.new(vector.x - 2, vector.y + 1),

    Vertex.new(vector.x + 1, vector.y - 2),
    Vertex.new(vector.x - 1, vector.y - 2),

    Vertex.new(vector.x + 2, vector.y - 1),
    Vertex.new(vector.x - 2, vector.y - 1)
  ]
end
