# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# so this is interesting because if you set the play loop to equal 9, then turn runs 10 times
# what this does is it causes the board to fill up and then have one more turn but the valid move
# method doesnt work so turn just keeps looping, from the "else section of the turn method."
# Define your play method below
# def play(board)
#   counter = 0
#   until counter == 9
#     turn(board)
#     counter += 1
#   end
# end

def play(board)
  counter = 0
  while counter < 9
    turn(board)
    counter += 1
  end
end
