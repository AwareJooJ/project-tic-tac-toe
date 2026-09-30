board_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def print_board(board)
  puts("\n")
  puts(" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts("---+---+---")
  puts(" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts("---+---+---")
  puts(" #{board[6]} | #{board[7]} | #{board[8]} ")
  puts("\n")
end

curr_choice = "X"
curr_position = 9

if curr_position < 0 || curr_position > 8
  puts "Invalid number! Pick a number between 1 and 9"
end
if board[curr_position] == "X" || board[curr_position] == "O"
  puts "Spot already taken, try another one"
end
board[curr_position] = curr_choice

print_board(board_positions)
print_board(board)