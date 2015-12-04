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
    # input: x index of cell (int) and y index of cell (int)
    # output: 2d array consisiting of numbers from both parallel rows (array)
    case cell_x_index % 3
      when 0
        puts "row is top"
      when 1
        puts "row is middle"
        # if own_row is in the middle of the cube, return the rows to its top and bottom
        left_row = @board[cell_x_index - 1]
      when 2
        puts "row is bottom"
      end
  end

  def numbers_in_parallel_column(cell_x_index, cell_y_index)
    # input: x index of cell (int) and y index of cell (int)
    # output: 2d array consisiting of numbers from both parallel columns (array)

    case cell_y_index % 3
      when 0
        puts "column is left"
      when 1
        puts "column is middle"
      when 2
        puts "column is right"
      end
  end

  def number_empty_cells_in_own_cube_row(cell_x_index, cell_y_index)
  end

  def number_empty_cells_in_own_cuve_column(cell_x_index, cell_y_index)
  end

  def solve
    p "parallel rows: "
    p numbers_in_parallel_row(1, 1)
    p "parallel columns: "
    p numbers_in_parallel_column(1, 1)
  end

  def pretty_print_board
    puts "- - - - - - - - - - - - - - - -"
    cube_horiz_print_counter = 1
    @board.each {|row|
      cube_vert_print_counter = 1
      print "| "
      row.each { |cell|
        print " " + cell + " "
        print "|" if cube_vert_print_counter == 3 || cube_vert_print_counter == 6
        cube_vert_print_counter += 1
      }
      print "| "
      puts
      puts "- - - - - - - - - - - - - - - -" if cube_horiz_print_counter == 3 || cube_horiz_print_counter == 6
      cube_horiz_print_counter += 1
    }
    puts "- - - - - - - - - - - - - - - -"
  end

  # Returns a string representing the current state of the board
  def to_s
    board_as_string = ""
    board.each do |row|
      board_as_string += row.join("")
    end
    return board_as_string
  end
end