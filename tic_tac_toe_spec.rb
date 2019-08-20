require_relative 'tic_tac_toe.rb'

describe "Tic_Tac_Toe" do
  before(:each) do
    @ttt = Tic_Tac_Toe.new
  end
  #use helper method for board[2] = "X"
  let(:board) { @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] }

  it "board should be initially empty" do
    expect(board).to eql(@board)
  end

  it "display should be empty first" do
    expect(@ttt.display_board(1)).to be nil
  end

  it "input should be integer" do
    expect(@ttt.input_to_index("5")).to eql(4)
  end

  it "should make a move" do
    expect(@ttt.move(board, 2, "X")).to eql("X")
  end

  it "board position should be taken" do
    board[2] = "X"
    expect(@ttt.position_taken?(board, 2)).to be true
  end

  it "board position should not be taken" do
    expect(@ttt.position_taken?(board, 4)).to be false
  end

  it "should a valid move" do
    board[3] = "X" 
    expect(@ttt.valid_move?(board, 2)).to be true
  end

  it "should not be a valid move" do
    board[9] = "O"
    expect(@ttt.valid_move?(board, 9)).to be false
  end
 
  it "trun should be counted" do
    board[5] = "O"
    expect(@ttt.turn_count(board)).to eql(1)
  end

  it "current player should be checked" do
    player = @ttt.current_player(board) 
    expect(player).to eql("X")
  end

  #it "player should taking turn" do
    #board[5] = "X" #should accept display be similiar
    #expect(@ttt.turn(board)).to eql(board)
  #end

  it "should have all winning combinations" do
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([0, 1, 2])
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([3, 4, 5])
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([6, 7, 8])
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([0, 3, 6])
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([1, 4, 7])
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([2, 5, 8])
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([0, 4, 8])
    expect(Tic_Tac_Toe::WIN_COMBINATIONS).to include([6, 4, 2])           
  end

  it "player should be won" do
    board[0] = "X"
    board[1] = "X"
    board[2] = "X"
    expect(@ttt.won?(board)).to be true
  end

  it "player should not be won" do
    board[0] = "X"
    board[1] = "O"
    board[2] = "X"
    expect(@ttt.won?(board)).to be false
  end

  it "board should be full" do
    board = ["X", "X", "O", "O", "O", "X", "X", "X", "O"]
    expect(@ttt.full?(board)).to be true
  end

  it "board should not be full" do
    board = ["X", "", "O", "", "O", "", "X", "", ""]
    expect(@ttt.full?(board)).to be false
  end

  it "should draw when all field are taken" do
    board = ["X", "X", "O", "O", "O", "X", "X", "O", "O"]
    expect(@ttt.draw?(board)).to be true
  end

  it "should not draw when all field are not taken" do
    board = ["X", "X", "O", "", "", "X", "", "", "O"]
    expect(@ttt.draw?(board)).to be false
  end

  it "game should not draw when a player won" do
    board = ["X", "X", "X", "", "O", "", "O", "", "O"]
    expect(@ttt.draw?(board)).to be false
  end

  it "game should over when a player win" do 
    board = ["X", "X", "X", "", "O", "", "O", "", "O"]
    expect(@ttt.over?(board)).to be true
  end

  it "game should over when all field are taken" do
    board = ["X", "X", "O", "O", "O", "X", "X", "O", "O"]
    expect(@ttt.over?(board)).to be true
  end

  it "game should not over when field is not full" do
    board = ["X", "X", "O", "", "", "X", "", "", "O"]
    expect(@ttt.over?(board)).to be false
  end

  it "game should have 2 player" do
    board = ["X", "X", "O", "O", "O", "X", "X", "O", "O"]
    expect(@ttt.player(board)).to be true
  end

  describe "should show correct winner" do 
    it "should X when X won" do 
      board = ["X", "X", "X", "O", "O", " ", " ", "O", " "]
      expect(@ttt.winner(board)).to eql('X')
    end

    it "should O when O won" do 
      board = ["O", "O", "O", "X", "X", " ", " ", "X", " "]
      expect(@ttt.winner(board)).to eql('O')
    end
  end

end