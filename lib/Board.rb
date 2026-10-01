class Board
  attr_reader :grid

  def initialize
    @grid = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def print_board
    puts "\n"
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts '---+---+---'
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts '---+---+---'
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    puts "\n"
  end

  def update_board(position, choice)
    @grid[position - 1] = choice
  end

  def valid?(curr_position)
    curr_position.between?(1, 9) && @grid[curr_position - 1] == ' '
  end

  def full?
    !@grid.include?(' ')
  end
end
