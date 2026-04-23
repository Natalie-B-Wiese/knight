require_relative 'vertex'

def knight_moves(start_point, goal_point)
  path = shortest_path(start_point, goal_point)
  puts "You made it in #{path.length} moves! Here's your path: "
  puts path

  path
end

# returns the shortest path from start_point to goal_point
def shortest_path(start_point, goal_point)
  all_paths = []

  all_paths.push([Vertex.new(start_point[0], start_point[1])])

  # keep repeating using inorder traversal until it returns a path that reaches the goal
  # Every time it loops, it increases the search depth by 1
  # Therefore, the first path it returns is guaranteed to be the shortest
  loop do
    num_all_paths = all_paths.length

    num_all_paths.times do
      current_path = all_paths.shift
      last_vertex_of_path = current_path[current_path.length - 1]
      all_paths += single_move_to_goal(last_vertex_of_path, current_path[0...(current_path.length - 1)])
    end

    path = goal_reach_path(all_paths, goal_point)
    return path unless path.nil?
  end
end

# returns the path that reached the goal
# If no path reached goal, returns nil
def goal_reach_path(all_paths, goal_point)
  all_paths.each do |current_path|
    last_vertex_of_path = current_path[current_path.length - 1]
    return current_path if last_vertex_of_path == goal_point
  end
  nil
end

# pretty print for showing all_paths
def print_all_paths(all_paths)
  puts 'all_paths: '
  puts '['
  all_paths.each do |path|
    print_path(path, 3)
  end

  puts ']'
end

# a pretty print for a single path
def print_path(path, indent_amount = 0)
  print ' ' * indent_amount
  print '[ '
  path.each do |vertex|
    print vertex
  end
  puts ' ]'
end

# attempts to do a single move to arrive at the goal and returns the path
# If a move cannot be done to arrive at the goal, it is nil
def single_move_to_goal(current_vertex, path = [])
  # print "#{path}\n"

  all_paths = []

  path_copy = path.dup
  path_copy.push(current_vertex)

  leaves = valid_leaves(current_vertex, path_copy)
  leaves.each do |leaf|
    all_paths.push(path_copy + [leaf])
  end

  all_paths
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
