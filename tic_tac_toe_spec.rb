require_relative 'tic_tac_toe.rb'

describe "Tic_Tac_Toe" do
  before(:each) do
    @ttt = Tic_Tac_Toe.new
  end

  let(:output) { puts row = [ " " " | " " " " | " " "]
    puts divisior = "---------"
    puts row
    puts divisior
    puts row }

  it "display should be initially empty" do
    expect(output).to eql(@ttt.display_board())
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

  it "should a valid move" do 
    skip
    move_index = @ttt.move
    expect(move_index).to be_valid
  end

end