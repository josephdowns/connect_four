require "./lib/board"
require "./lib/turn.rb"
require "rspec"
require "pry"

#end_game? #method

empty_board = Board.new({}).empty_board
turn = Turn.new

describe Turn do
  xit "declares winner player column" do
    current_board = empty_board
    4.times do
      turn.player_move('G', current_board)
    end

    expect(turn.end_game?).to eq("You win!")

  end

  xit "declares winner player row" do
    current_board = empty_board
    turn.player_move("A", current_board)
    turn.player_move("B", current_board)
    turn.player_move("C", current_board)
    turn.player_move("D", current_board)
    expect(turn.end_game?).to eq("You win!")
  end

  xit "declares winner computer column" do
    current_board = empty_board
    current_board[:B1] = "o"
    current_board[:B2] = "o"
    current_board[:B3] = "o"
    current_board[:B4] = "o"

    expect(turn.end_game?).to eq("You lose.")
  end

  xit "declares winner computer row" do
    current_board = empty_board
    current_board[:B1] = "o"
    current_board[:C1] = "o"
    current_board[:D1] = "o"
    current_board[:E1] = "o"

    expect(turn.end_game?).to eq("You lose.")
  end

  it "declares draw" do
    current_board = empty_board
    draw_board = {}
    current_board.each do |k, v|
        draw_board[k] = "w"
    end

    expect(turn.end_game?).to eq("Draw!")
  end
end
