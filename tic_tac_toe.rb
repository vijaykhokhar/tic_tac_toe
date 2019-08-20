class Tic_Tac_Toe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  @winner_player = ''
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

  def player_number(board)
    turn_count(board) % 2 == 0 ? "1" : "2"
  end

  def turn(board)
    puts "Please, player #{player_number(board)} enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
      turn(board) if !won?(board) && !full?(board)
    end
    #return board
    #display_board(board)
  end

  def play(board)
    display_board(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
      winner(board) == "X" || winner(board) == "O"
      puts "Congratulation #{winner(board)}"
    elsif draw?(board)
      puts "Cats game"
    end
  end
  
  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
        @winner_player = position_1
        return true 
      end
    end
    return false
  end

  def full?(board)
    board.all? { |i| i == "X" || i == "O" }
  end

  def draw?(board)
    if won?(board)
      return false
    elsif !won?(board) && !full?(board)
      return false
    else !won?(board) && full?(board)
      return true
    end
  end

  def over?(board)
    if won?(board) || full?(board)
      return true
    end
    return false
  end

  def winner(board)
    return @winner_player if won?(board)
  end

  def player(board)
    board.all? { |i| i == "X" || i == "O"}
  end
  Tic_Tac_Toe.new.play(board)  
end