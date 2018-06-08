require_relative 'matrix'

def pick_cell(matrix)
  if filled?(matrix)
    return nil
  end

  max = { position: nil, num_placed: 0 }

  (1..N).each do |i|
    (1..N).each do |j|
      next if placed?(matrix, i, j)
      num_placed =
        [get_row(matrix, i), get_col(matrix, j), get_block(matrix, get_block_index_from_pos(i, j))]
        .map{|m| count_placed(m) }
        .sum
      if num_placed > max[:num_placed]
        max[:position] = [i, j]
        max[:num_placed] = num_placed
      end
    end
  end

  max[:position]
end

def solve(input, debug: false)
  stack = []
  stack.push(input)
  solution = nil

  loop do
    matrix = stack.pop
    puts matrix if debug

    if matrix.nil?
      # Search finished
      return solution
    end

    if filled?(matrix)
      unless solution.nil?
        # Has multiple solutions
        return nil
      end
      # Solution found
      puts "/** Solution found **/" if debug
      solution = matrix
      next
    end

    i, j = pick_cell(matrix)
    (1..N).each do |n|
      if can_place?(matrix, i, j, n)
        new_matrix = set_cell(matrix, i, j, n)
        stack.push(new_matrix)
      end
    end
  end
end
