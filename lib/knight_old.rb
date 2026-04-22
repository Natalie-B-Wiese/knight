# frozen_string_literal: true

SIZE = 8

def knight_moves(start_point, goal_point, path = [])
  return all_paths(start_point, goal_point)

  return full_path(start_point, goal_point)

  return nil if path.nil?

  current_point = [start_point[0], start_point[1]]

  path.push(current_point)

  if start_point == goal_point
    puts 'reached goal position!'

    print "Path is: #{path}"
    puts "\n"
    return path
  end

  # an array of points that knight can go next
  next_points = valid_vertices(vertices_from_point(current_point))

  # prevent it from visiting same point twice on this path
  next_points = next_points.reject { |point| path.include?(point) }

  if next_points.empty?
    print "Path does not reach destination: #{path}"
    puts "\n"
    nil
  else
    all_paths = []

    next_points.each do |current_point|
      path = knight_moves(current_point, goal_point, path)

      # # if path reaches destination, add it as a valid path to all_paths
      all_paths.push(path) unless path.nil?
    end

    # check for shortest path in all_paths
    puts 'check for shortest path in all_paths and return that path'

    return nil if all_paths.empty?

    # return the shortest path
    all_paths.min { |a, b| a.length <=> b.length }

  end
end

# constructs an array of all possible paths from the specified start position
def all_paths(start_point, goal_point, path = [])
  tree = []

  path_arrays = []

  current_point = [start_point[0], start_point[1]]
  path.push(current_point)

  # an array of points that knight can go to next, exluding points already visited
  leaves = valid_next_points(current_point, path)

  leaves.each do |leaf|
    if leaf == goal_point
      depth = 1
      tree.push([]) while tree.length < depth
      puts "leaf #{leaf} is the goal point #{goal_point}"
      path_arrays.push(path + [leaf])
      tree[depth - 1].push(path + [leaf])
    else
      puts "leaf #{leaf} is not goal point #{goal_point}"
      depth = 2
    end
  end

  p tree

  p path_arrays[0]
  return path_arrays[0] unless path_arrays.empty?

  # if it wasn't in the first one
  puts 'seeing if the path is 2'
  current_point = leaves.shift
  path.push(current_point)

  # an array of points that knight can go to next, exluding points already visited
  leaves = valid_next_points(current_point, path)

  leaves.each do |leaf|
    if leaf == goal_point
      puts "leaf #{leaf} is the goal point #{goal_point}"
      path_arrays.push(path + [leaf])
    else
      puts "leaf #{leaf} is not goal point #{goal_point}"
    end
  end

  p path_arrays[0]
  return path_arrays[0] unless path_arrays.empty?

  # if it wasn't in the second one
  puts 'seeing if the path is 3'
  current_point = leaves.shift
  path.push(current_point)

  # an array of points that knight can go to next, exluding points already visited
  leaves = valid_next_points(current_point, path)

  leaves.each do |leaf|
    if leaf == goal_point
      puts "leaf #{leaf} is the goal point #{goal_point}"
      path_arrays.push(path + [leaf])
    else
      puts "leaf #{leaf} is not goal point #{goal_point}"
    end
  end

  p path_arrays[0]
  return path_arrays[0] unless path_arrays.empty?

  puts 'hi'
end

# returns a jagged array of all paths from start_point
# array[0] refers to a specific path
# array[0][0] refers to a vertex in a specific path
def full_path(start_point, goal_point, path = [], all_paths = [])
  print "Running it with path: #{path} \n"
  if path.include?(goal_point)
    print "This path already reached goal position #{path} \n"
    return path
  end

  current_point = [start_point[0], start_point[1]]
  path.push(current_point)

  # an array of points that knight can go to next, exluding points already visited
  next_points = valid_next_points(current_point, path)

  if current_point == goal_point
    print "Path reached goal position: #{path} \n"
    path
  elsif next_points.empty?
    print "Error: Path could not reach destination and has nowhere else to go: #{path} \n"
    all_paths.push(path)
  else
    path_arrays = []

    # next_points.each_with_index do |point, index|
    # do a deep copy cause a path is a 3D array (array of paths, array of vertexes, array with x and y)
    #  path_copy = Marshal.load(Marshal.dump(path))
    #  path_arrays[index] = full_path(point, goal_point, path_copy)
    #  print "#{path_arrays[index]} \n"
    # end

    ## do a deep copy cause a path is a 3D array (array of paths, array of vertexes, array with x and y)
    path_copy = Marshal.load(Marshal.dump(path))
    path_arrays[0] = full_path(next_points[0], goal_point, path_copy, all_paths)
    print "#{path_arrays[0]} \n"

    path_arrays[0]
  end
end

# returns an array of valid next points
# If a point apepars in reject_array, that point is excluded
def valid_next_points(current_point, reject_array)
  valid_vertices(vertices_from_point(current_point)).reject { |point| reject_array.include?(point) }
end

# returns an array of valid vertices in vector_array
def valid_vertices(vector_array)
  vector_array.select { |vector| valid_vertex?(vector) }
end

# returns an array of all 8 move places from point
def vertices_from_point(vector)
  next_points = []

  # a knight can move 8 directions:
  # right 1, up 2
  next_points.push(shift_point(vector, 1, 2))

  # left 1, up 2
  next_points.push(shift_point(vector, -1, 2))

  # right 2, up 1
  next_points.push(shift_point(vector, 2, 1))

  # left 2, up 1
  next_points.push(shift_point(vector, -2, 1))

  # right 1, down 2
  next_points.push(shift_point(vector, 1, -2))

  # left 1, down 2
  next_points.push(shift_point(vector, -1, -2))

  # right 2, down 1
  next_points.push(shift_point(vector, 2, -1))

  # left 2, down 1
  next_points.push(shift_point(vector, -2, -1))

  next_points
end

# returns true if the vertex is valid, false if the vertex is out of bounds
def valid_vertex?(vector)
  x = vector[0]
  y = vector[1]
  return false if x.negative? || y.negative? || x > (SIZE - 1) || y > (SIZE - 1)

  true
end

# returns a new point that is shifted by an amount
def shift_point(vector, x_amount, y_amount)
  new_point = []
  new_point[0] = vector[0] + x_amount
  new_point[1] = vector[1] + y_amount
  new_point
end
