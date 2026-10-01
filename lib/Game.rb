require './lib/Player'

class Game
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize
    @board = Board.new
    @p1 = Player.new('Player 1', 'X')
    @p2 = Player.new('Player 2', 'O')
    @current_player = @p1
  end

  def play
    puts 'Welcome to Tic Tac Toe!'

    until game_over?
      @board.print_board
      take_turn
      switch_player unless check_win? || tie?
    end

    @board.print_board
    announce_result
  end

  private

  def take_turn
    puts "#{@current_player.name}, it's your turn. Please enter a position (1-9):"
    position = gets.chomp.to_i

    if @board.valid?(position)
      @board.update_board(position, @current_player.selection)
    else
      puts 'Invalid position! Please choose a number between 1 and 9 that is not already taken.'
      take_turn
    end
  end

  def switch_player
    @current_player = @current_player == @p1 ? @p2 : @p1
  end

  def check_win?
    WIN_COMBINATIONS.any? do |condition|
      condition.all? { |index| @board.grid[index] == @current_player.selection }
    end
  end

  def tie?
    @board.full? && !check_win?
  end

  def game_over?
    check_win? || tie?
  end

  def announce_result
    if check_win?
      puts "#{@current_player.name} wins!"
    elsif tie?
      puts "It's a tie!"
    end
  end
end
