class Tic_Tac_Toe
  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  
  def display_board(board)
    puts [ " #{board[0]} " " | " " #{board[1]} " " | " " #{board[2]} "]
    puts "---------------"
    puts [ " #{board[3]} " " | " " #{board[4]} " " | " " #{board[5]} "]
    puts "---------------"
    puts [ " #{board[6]} " " | " " #{board[7]} " " | " " #{board[8]} "]
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(board, index, player)
    board[index] = player
  end

  def position_taken?(board, index)
    return false if( board[index] == " " || board[index] == "" || board[index] == nil)
    return true
  end

  def valid_move?(board, index)
    return true if( index.between?(0,8) && !position_taken?(board, index))
    return false
  end

  def turn_count(board)
    counter = 0
    board.each do |spaces|
      counter += 1 if(spaces == "X" || spaces == "O")
    end
    counter
  end

  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end
  #puts Tic_Tac_Toe.new.turn_count(board)  
end