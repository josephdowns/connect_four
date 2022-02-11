require "./lib/board"
require "./lib/turn.rb"
require "rspec"
require "pry"

#end_game? #method

empty_board = Board.new({}).empty_board
turn = Turn.new

describe Turn do
  it "declares winner player" do
    current_board = empty_board
    4.times do
      turn.player_move('G', current_board)

    expect(turn.end_game?).to eq("You win!")

  end

  it "declares winner computer" do

    expect(turn.end_game?).to eq("You lose.")
  end

  it "declares draw" do
    expect(turn.end_game?).to eq("Draw!")
  end
end
