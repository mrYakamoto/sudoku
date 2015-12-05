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
  attr_reader :possible_numbers

  def initialize(board_string)
    @board = generate_board(board_string)
    create_possible_numbers
  end

  def generate_board(string)
    board = []
    9.times { board <<  string.slice!(0,9).split("") }
    board
  end

  def create_possible_numbers
    @possible_numbers = ["1","2","3","4","5","6","7","8","9"]
  end

  def eliminate_numbers_in_own_row(cell_x_index)
    # return @board[cell_x_index]
    @board[cell_x_index].each{ |num| eliminate_possible_numbers(num) }
  end

  # def eliminate_numbers_in_own_cube(cell_x_index)
  #   # return @board[cell_x_index]
  #   @board[cell_x_index].each{ |num| eliminate_possible_numbers(num) }
  # end

  def eliminate_numbers_in_own_column(cell_y_index)
    column = []
    @board.each{|row| column << row[cell_y_index] }
    column.each { |num| eliminate_possible_numbers(num)}
  end

<<<<<<< HEAD
  def eliminate_numbers_in_own_cube(cell_x_index, cell_y_index)
    numbers_in_own_cube(cell_x_index, cell_y_index).flatten.each{ |num| eliminate_possible_numbers(num) }
  end

  def eliminate_possible_numbers(int)
    if @possible_numbers.any?{|num|num == int}
      @possible_numbers.delete(int)
    end
=======

  def numbers_in_parallel_row(cell_x_index, cell_y_index)
    # input: x index of cell (int) and y index of cell (int)
    # output: 2d array consisiting of numbers from both parallel rows (array)
    case cell_x_index % 3
      when 0
        # if own_row is at the top of the cube, return the next 2 rows
        # puts "top row"
        row1 = @board[cell_x_index + 1]
        row2 = @board[cell_x_index + 2]
      when 1
        # if own_row is in the middle of the cube, return the rows to its top and bottom
        # puts "middle row"
        row1 = @board[cell_x_index - 1]
        row2 = @board[cell_x_index + 1]
      when 2
        #if own_row is at the bottom, return the 2 rows on top
        # puts "bottom row"
        row1 = @board[cell_x_index - 1]
        row2 = @board[cell_x_index - 2]
      end
      return [row1, row2]
  end

  def numbers_in_parallel_column(cell_x_index, cell_y_index)
    # input: x index of cell (int) and y index of cell (int)
    # output: 2d array consisiting of numbers from both parallel columns (array)
    case cell_x_index % 3
      when 0
        # if own_col is on the left side of the cube, return the 2 columns to its right
        # puts "left col"
        row1 = []
        row_counter = 0
        9.times {
          row1 << @board[row_counter][cell_y_index + 1]
          row_counter += 1
        }
        row_counter = 0
        row2 = []
        9.times {
          row2 << @board[row_counter][cell_y_index + 2]
          row_counter += 1
        }
      when 1
        # if own_col is in the middle of the cube, return the columns to its left and right
        # puts "mid col"
        row1 = []
        row_counter = 0
        9.times {
          row1 << @board[row_counter][cell_y_index - 1]
          row_counter += 1
        }
        row_counter = 0
        row2 = []
        9.times {
          row2 << @board[row_counter][cell_y_index + 1]
          row_counter += 1
        }
      when 2
        # if own_col is on the right side of the cube, return the 2 columns to its left
        # puts "right col"
        row1 = []
        row_counter = 0
        9.times {
          row1 << @board[row_counter][cell_y_index - 1]
          row_counter += 1
        }
        row_counter = 0
        row2 = []
        9.times {
          row2 << @board[row_counter][cell_y_index - 2]
          row_counter += 1
        }
      end
      return [row1, row2]
>>>>>>> master
  end

  def examine_numbers_in_parallel_columns(parallel_nums)
    @possible_numbers.each do |num|
      p num
      p parallel_nums.flatten
      p parallel_nums.count(num)
      correct_number = nil
      if (parallel_nums.flatten.count(num) == 2) && (number_empty_cells_in_own_cube_column == 1)
        correct_number = num
      end
    end
    nil
    # correct_number = nil
    # for (num in possible_numbers) do
    #   if ( parallel_nums[0].any?{ |cell| cell == num } ) && (parallel_nums[1].any?{ |cell| cell == num } ) && (number_empty_cells_in_own_cube_column == 1)
    #     correct_number = num
    #     return correct_number
    #   end
    # end
    # return nil
  end

#   - find numbers in own cube
#     - eliminate numbers in cube from possible numbers
=begin
input =
output = existing numbers in a cube (cube is defined as a 3x3 of cells)
Step 1: divide the board into 9 sections.
Each section contains a cube
  How will we accomplish Step 1?
Step 2: define an array called "all_cube_indexes"
"all_cube_indexes" contains 9 cubes.
Each "cube" is an array w/ 3 rows, & each row has 3 elements
Each element is an index of a row & a column
Step 3:
Input the corresponding index of the arrays (from board) into
each individual cube.
Step 4:
Compare cell position w/ "all_cube_indexes":
Iterate through "all_cube_indexes" to identify w/ch cube contains a number
Step 5:
Create an empty array called "cube_values" w/ch contains the
actual values that we derived from the indices found in
"all_cube_indexes"
=end

  def numbers_in_own_cube(cell_x_index, cell_y_index)
    all_cube_indexes = Array.new(3, [])
    cube_indexes = []

    # all_cube_indexes.cycle(all_cube_indexes.length - 1) { |each_row|
    #   puts each_row
    #   for row in all_cube_indexes do
    #     puts row
    #   end
    # }

    if cell_x_index == 0 || cell_x_index == 1 || cell_x_index == 2
      if cell_y_index == 0 || cell_y_index == 1 || cell_y_index == 2
        cube_values = [[board[0][0], board[0][1], board[0][2]],
                        [board[1][0], board[1][1], board[1][2]],
                        [board[2][0], board[2][1], board[2][2]]]

      elsif cell_y_index == 3 || cell_y_index == 4 || cell_y_index == 5
        cube_values = [[board[0][3], board[0][4], board[0][5]],
                        [board[1][3], board[1][4], board[1][5]],
                        [board[2][3], board[2][4], board[2][5]]
                        ]
      else
        cube_values = [[board[0][6], board[0][7], board[0][8]],
                        [board[1][6], board[1][7], board[1][8]],
                        [board[2][6], board[2][7], board[2][8]]
                        ]
      end
    elsif cell_x_index == 3 || cell_x_index == 4 || cell_x_index == 5
      if cell_y_index == 0 || cell_y_index == 1 || cell_y_index == 2
        cube_values = [[board[3][0], board[3][1], board[3][2]],
                        [board[4][0], board[4][1], board[4][2]],
                        [board[5][0], board[5][1], board[5][2]]
                        ]
      elsif cell_y_index == 3 || cell_y_index == 4 || cell_y_index == 5
        cube_values = [[board[3][3], board[3][4], board[3][5]],
                        [board[4][3], board[4][4], board[4][5]],
                        [board[5][3], board[5][4], board[5][5]]
                        ]
      else
        cube_values = [[board[3][6], board[3][7], board[3][8]],
                        [board[4][6], board[4][7], board[4][8]],
                        [board[5][6], board[5][7], board[5][8]]
                        ]
      end
    else
      if cell_y_index == 0 || cell_y_index == 1 || cell_y_index == 2
        cube_values = [[board[6][0], board[6][1], board[6][2]],
                        [board[7,0], board[7][1], board[7][2]],
                        [board[8,0], board[8][1], board[8][2]]
                        ]
      elsif cell_y_index == 3 || cell_y_index == 4 || cell_y_index == 5
        cube_values = [[board[6][3], board[6][4], board[6][5]],
                        [board[7][3], board[7][4], board[7][5]],
                        [board[8][3], board[8][4], board[8][5]]
                        ]
      else
        cube_values = [[board[6][6], board[6][7], board[6][8]],
                        [board[7][6], board[7][7], board[7][8]],
                        [board[8][6], board[8][7], board[8][8]]
                        ]
      end
    end
  end

<<<<<<< HEAD

  def numbers_in_parallel_row(cell_x_index, cell_y_index)
    # input: x index of cell (int) and y index of cell (int)
    # output: 2d array consisiting of numbers from both parallel rows (array)
    case cell_x_index % 3
      when 0
        # if own_row is at the top of the cube, return the next 2 rows
        # puts "top row"
        row1 = @board[cell_x_index + 1]
        row2 = @board[cell_x_index + 2]
      when 1
        # if own_row is in the middle of the cube, return the rows to its top and bottom
        # puts "middle row"
        row1 = @board[cell_x_index - 1]
        row2 = @board[cell_x_index + 1]
      when 2
        #if own_row is at the bottom, return the 2 rows on top
        # puts "bottom row"
        row1 = @board[cell_x_index - 1]
        row2 = @board[cell_x_index - 2]
      end
      return [row1, row2]
  end

  def numbers_in_parallel_column(cell_x_index, cell_y_index)
    # input: x index of cell (int) and y index of cell (int)
    # output: 2d array consisiting of numbers from both parallel columns (array)
    case cell_x_index % 3
      when 0
        # if own_col is on the left side of the cube, return the 2 columns to its right
        # puts "left col"
        row1 = []
        row_counter = 0
        9.times {
          row1 << @board[row_counter][cell_y_index + 1]
          row_counter += 1
        }
        row_counter = 0
        row2 = []
        9.times {
          row2 << @board[row_counter][cell_y_index + 2]
          row_counter += 1
        }
      when 1
        # if own_col is in the middle of the cube, return the columns to its left and right
        # puts "mid col"
        row1 = []
        row_counter = 0
        9.times {
          row1 << @board[row_counter][cell_y_index - 1]
          row_counter += 1
        }
        row_counter = 0
        row2 = []
        9.times {
          row2 << @board[row_counter][cell_y_index + 1]
          row_counter += 1
        }
      when 2
        # if own_col is on the right side of the cube, return the 2 columns to its left
        # puts "right col"
        row1 = []
        row_counter = 0
        9.times {
          row1 << @board[row_counter][cell_y_index - 1]
          row_counter += 1
        }
        row_counter = 0
        row2 = []
        9.times {
          row2 << @board[row_counter][cell_y_index - 2]
          row_counter += 1
        }
      end
      return [row1, row2]
  end

  # def number_empty_cells_in_own_cube_row(cell_x_index, cell_y_index)
  # end

  # def number_empty_cells_in_own_cube_column(cell_x_index, cell_y_index)
   def number_empty_cells_in_own_cube_column
   return 1
  end

=======
>>>>>>> master
  def solve
    p "parallel rows: "
    p numbers_in_parallel_row(3, 3)
    p "parallel columns: "
    p numbers_in_parallel_column(3, 3)
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
<<<<<<< HEAD
end

game = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
game.pretty_print_board
puts "possible numbers are: "
p game.possible_numbers

game.eliminate_numbers_in_own_row(0)

puts "possible numbers are: "
p game.possible_numbers

game.eliminate_numbers_in_own_column(4)

puts "possible numbers are: "
p game.possible_numbers

game.eliminate_numbers_in_own_cube(0,4)

puts "possible numbers are: "
p game.possible_numbers
# p game.examine_numbers_in_parallel_columns([["3"],["3"]])
# # p game.numbers_in_own_row(0..9)
# # p game.numbers_in_own_column(1)















=======
end
>>>>>>> master
