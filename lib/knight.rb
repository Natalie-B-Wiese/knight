require_relative 'vertex'

def knight_moves(start_point, goal_point)
  path = []
  all_paths = []

  current_vertex = Vertex.new(start_point[0], start_point[1])

  path = single_move_to_goal(current_vertex, goal_point, [])
  return path unless path.nil?

  print 'try again'

  path
end

# attempts to do a single move to arrive at the goal and returns the path
# If a move cannot be done to arrive at the goal, it is nil
def single_move_to_goal(current_vertex, goal_point, path = [])
  print "#{path}\n"

  path_copy = path.dup
  path_copy.push(current_vertex)

  leaves = valid_leaves(current_vertex, path_copy)
  leaves.each do |leaf|
    next unless leaf == goal_point

    puts "Leaf #{leaf} is equal to the goal #{goal_point}"
    path_copy += [leaf]
    return path_copy
  end

  nil
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
