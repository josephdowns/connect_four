require "./lib/board"
require "./lib/turn"
require "rspec"
require "pry"
  empty_board = Board.new({}).empty_board # call empty_board -written in turn
  board = Board.new(empty_board) #feed empty_board into board to print
RSpec.describe Board do

  it "prints empty board" do
    # game = Board.new
    # binding.pry
    expect{board.print_board}.to output(
      <<~EXPECTED

      A B C D E F G
      . . . . . . .
      . . . . . . .
      . . . . . . .
      . . . . . . .
      . . . . . . .
      . . . . . . .
      EXPECTED
    ).to_stdout
  end



end
