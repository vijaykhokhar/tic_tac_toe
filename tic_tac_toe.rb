class Tic_Tac_Toe
  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  def display_board(board)
    puts [ " #{board[0]} " " | " " #{board[1]} " " | " " #{board[2]} "]
    puts "---------------"
    puts [ " #{board[0]} " " | " " #{board[1]} " " | " " #{board[2]} "]
    puts "---------------"
    puts [ " #{board[0]} " " | " " #{board[1]} " " | " " #{board[2]} "]
  end
  #Tic_Tac_Toe.new.display_board(board)  
end