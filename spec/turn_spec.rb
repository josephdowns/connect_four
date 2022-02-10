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

  it "test when column is full" do

    current_board = empty_board
    6.times do
      turn.player_move('G', current_board)
    end
    expect{turn.player_move('G', empty_board)}.to output(
      <<~EXPECTED
      
      ......x
      ......x
      ......x
      ......x
      ......x
      ......x
      ---Column full-select another column---
       EXPECTED
      ).to_stdout
  end




end
