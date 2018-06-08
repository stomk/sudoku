N = 9
EMPTY_CHAR = "0"

# 1..N^2
def get_cell_index_from_pos(i, j)
  (i - 1) * N + j
end

def get_cell(matrix, i, j)
  matrix[get_cell_index_from_pos(i, j) - 1]
end

def set_cell(matrix, i, j, n)
  matrix[get_cell_index_from_pos(i, j) - 1] = n.to_s
  matrix
end

def get_row(matrix, i)
  matrix.slice((i - 1) * N, N)
end

def get_col(matrix, i)
  (1..N).map{|n| matrix[(n - 1) * N + i - 1] }.join("")
end

def get_block(matrix, i)
  row = (i - 1) / 3 # 0..2
  col = (i - 1) % 3 # 0..2
  (1..3).map do |n|
    get_row(matrix, row * 3 + n).slice(col * 3, 3)
  end.join("")
end

def get_block_index_from_pos(i, j)
  (i - 1) / 3 * 3 + (j - 1) / 3 + 1
end

def can_place_in_row?(matrix, i, n)
  !get_row(matrix, i).include?(n.to_s)
end

def can_place_in_col?(matrix, i, n)
  !get_col(matrix, i).include?(n.to_s)
end

def can_place_in_block?(matrix, i, n)
  !get_block(matrix, i).include?(n.to_s)
end

def can_place?(matrix, i, j, n)
  can_place_in_row?(matrix, i, n) &&
  can_place_in_col?(matrix, j, n) &&
  can_place_in_block?(matrix, get_block_index_from_pos(i, j), n)
end

def placed?(matrix, i, j)
  get_cell(matrix, i, j) != EMPTY_CHAR
end

def count_unplaced(matrix)
  matrix.count(EMPTY_CHAR)
end

def count_placed(matrix)
  matrix.length - count_unplaced(matrix)
end
