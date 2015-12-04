# # PSEUDO

# INPUT: string
# OUTPUT: solution (solved string or unsolveable alert)

# - Create board
#   - an array of arrays of 9 (each row is an array)

# - Create possible numbers array (1..9)

# - iterate through cells

# - If cell is empty

#   - find numbers in own cube
#     - eliminate numbers in cube from possible numbers

#   - find numbers in own row
#     - eliminate numbers own row from possible numbers
#   - find numbers in own column
#     - eliminate numbers in owb column from possible numbers

#   - if possible numbers length = 1, cell = possible numbers[0]

#   - iterate remaining possible numbers
#     - if number is present in all parallel columns && parallel rows
#     cell = number

#   - iterate remaining possible numbers
#     - if number is present in both parallel columns
#     && own column has only one empty cell
#     cell = number

#    - iterate remaining possible numbers
#     - if number is present in both parallel rows
#     && own row has only one empty cell
#     cell = number

# possible numbers for cell
# numbers in own row
# numbers in own column
# numbers in own cube
# eliminate number from possible numbers

# numbers in parallel rows (one at a time)
# numbers in parallel columns (one at a time)
#   all parallel columns
# number of empty cells in own cube row
# number of empty cells in own cube column

class Sudoku
  attr_reader :board

  def initialize(board_string)
    @board = generate_board(board_string)
  end

  def generate_board(string)
    board = []
    9.times { board <<  string.slice!(0,9).split("") }
    board
  end

  def create_possible_numbers
    return ["1","2","3","4","5","6","7","8","9"]
  end

  def numbers_in_own_row(cell_x_index)
  end

  def numbers_in_own_column(cell_y_index)
  end

  def numbers_in_own_cube(cell_x_index, cell_y_index)
  end


  def numbers_in_parallel_row(cell_x_index, cell_y_index)
    # nil
  end

  def numbers_in_parallel_column(cell_x_index, cell_y_index)
    # nil
  end

  def number_empty_cells_in_own_cube_row(cell_x_index, cell_y_index)
  end

  def number_empty_cells_in_own_cuve_column(cell_x_index, cell_y_index)
  end

  def solve
  end

  def print_board
    @board.each {|row|
      p row
    }
  end

  # Returns a string representing the current state of the board
  def to_s
  end
end