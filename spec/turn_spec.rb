require './lib/board'
require './lib/turn'
require 'rspec'
require 'pry'
#initialize a board class
empty_board = Board.new({}).empty_board
turn = Turn.new

RSpec.describe Turn do

  context "player_move" do
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

      it "is an invalid move" do
        turn_new = Turn.new
        eb= Board.new({}).empty_board
          expect{turn_new.player_move("Z", eb)}.to output(
            <<~EXPECTED
            .......
            .......
            .......
            .......
            .......
            .......
            Invalid column selected. Please try again (A-G)
              EXPECTED
          ).to_stdout
        end

      it "tests when column is full" do
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
          ***Column full-select another column***
           EXPECTED
         ).to_stdout
      end


  end


  context "computer_move" do
    xit "tests whether two imputs give different outputs" do
      turn_new = Turn.new
      eb= Board.new({}).empty_board
      expect{turn_new.computer_move(eb)}.to !eq(turn_new.computer_move(eb))
    end

  end



end
