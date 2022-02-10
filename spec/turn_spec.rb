require './lib/board'
require './lib/turn'
require 'rspec'
require 'pry'
#initialize a board class
empty_board = Board.new({}).empty_board 
turn = Turn.new

RSpec.describe Turn do

  it "test the move" do

    expect{turn.player_move('G', empty_board)}.to output(
      <<~EXPECTED
      .......
      .......
      .......
      .......
      .......
      ......x
       EXPECTED
      ).to_stdout
  end

  xit "test when column is full" do
    game_run = Board.new

    7.times do
      game_run.move('A')
    end
  end



end
