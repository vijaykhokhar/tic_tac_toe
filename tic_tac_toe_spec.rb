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

  it "should have all winning combinations" do
    skip
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([0, 1, 2])
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([3, 4, 5])
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([6, 7, 8])
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([0, 3, 6])
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([1, 4, 7])
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([2, 5, 8])
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([0, 4, 8])
    expect(Tic_Tac_Toe::WIN_COMBINATION).to include_array([6, 4, 2])           
  end

  it "game should have 2 player" do
    skip
    player = @ttt.move
    expect(player).to eq(" X " || " O ")
  end

  it "player should take turn alternative" do
    skip
    player_turn = @ttt.turn
    expect(player_turn).to be_valid
  end

  it "player should takes turn untill game is over" do
    skip
    players_move = @ttt.move
    expect(players_move).to be < 10
  end

  it "player should claim a empty field" do
    skip
    position = @ttt.index_position
    expect(position).to be nil
  end

  it "player should win when player claim all field in a row, column or a dignoal" do 
    skip
    expect(@ttt.WIN_COMBINATION).to be true 
  end

  it "game should over when a player win" do 
    skip
    board = ["X", "X", "X", "", "O", "", "O", "", "O"]
    exptect(@ttt.over?).to be true
  end

  it "game should over when all field are taken" do
    skip
    board = ["X", "X", "O", "O", "O", "X", "X", "O", "O"]
    expect(@ttt.over?).to be true
  end

  it "should draw when all field are taken" do
    skip
    board = ["X", "X", "O", "O", "O", "X", "X", "O", "O"]
    expect(@ttt.draw?).to be true
  end

  describe "should show correct winner" do 
    it "should X when X won" do 
      skip
      board = ["X", "X", "X", "O", "O", " ", " ", "O", " "]
      expect(@ttt.winner).to be 'X'
    end

    it "should O when O won" do 
      skip
      board = ["O", "O", "O", "X", "X", " ", " ", "X", " "]
      expect(@ttt.winner).to be 'O'
    end
  end

end