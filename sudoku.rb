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

  def eliminate_numbers_in_own_column(cell_y_index)
    column = []
    @board.each{|row| column << row[cell_y_index] }
    column.each { |num| eliminate_possible_numbers(num)}
  end

  def eliminate_possible_numbers(int)
    if @possible_numbers.any?{|num|num == int}
      @possible_numbers.delete(int)
    end
  end

  def examine_numbers_in_parallel_columns(parallel_nums)
    p parallel_nums.flatten
    @possible_numbers.each do |num|
      correct_number = nil
      p parallel_nums.flatten
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


  def numbers_in_own_cube(cell_x_index, cell_y_index)
  end


  def numbers_in_parallel_row(cell_x_index, cell_y_index)
  end

  def numbers_in_parallel_column(cell_x_index, cell_y_index)
  end

  def number_empty_cells_in_own_cube_row(cell_x_index, cell_y_index)
  end

  # def number_empty_cells_in_own_cube_column(cell_x_index, cell_y_index)
   def number_empty_cells_in_own_cube_column
   return 1
  end






  def solve
  end

  # Returns a string representing the current state of the board
  def to_s
  end
end

game = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
p game.eliminate_numbers_in_own_row(0)
p game.possible_numbers
p game.eliminate_numbers_in_own_column(0)
p game.possible_numbers
p game.examine_numbers_in_parallel_columns([[3][3]])


# p game.numbers_in_own_row(0..9)
# p game.numbers_in_own_column(1)













