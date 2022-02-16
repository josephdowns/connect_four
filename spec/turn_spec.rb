require "./lib/board"
require "./lib/turn"
require "rspec"
require "pry"
#initialize a board class

RSpec.describe Turn do

  context "player_1_move" do

      it "test the move" do
        turn = Turn.new
        empty_board = Board.new({}).empty_board
        expect(turn.player_1_move("A", empty_board)).to eq(:A1)
      end

      it "is an invalid move" do #fails because of a new loop
        turn_new = Turn.new
        # binding.pry
          expect(turn_new.valid_move?("A")).to eq(true)
          expect(turn_new.valid_move?("H")).to eq(false)
      end

      it "tests when column is full" do #fails because of a new loop
        current_board = Board.new({}).empty_board
        turn = Turn.new
        6.times do
          turn.player_1_move("G", current_board)
        end
        expect(turn.column_full?("G")).to eq(true)

      end


  end


  context "computer_move" do
    it "tests whether computer does a valid move" do
      turn_new = Turn.new
      eb = Board.new({}).empty_board
      cb = eb
      columns = [ "A", "B", "C", "D", "E", "F", "G"]
      columns.each do |col|
        turn_new.player_1_move(col, cb)
        cb = turn_new.current_board
      end
      turn_new.computer_move(cb)
      # cb = turn_new.current_row
      row2 = [cb[:A2], cb[:B2], cb[:C2], cb[:D2], cb[:E2], cb[:F2], cb[:G2]]
      # binding.pry
      expect(row2.include?"O ").to eq(true)
    end

    it "has no more than 4 tests given same output out of 5 tests" do
      turn_new = Turn.new
      turn_new.computer_move(Board.new({}).empty_board)
      test1 = turn_new.current_board.invert["O "]
      turn_new.computer_move(Board.new({}).empty_board)
      test2 = turn_new.current_board.invert["O "]
      turn_new.computer_move(Board.new({}).empty_board)
      test3 = turn_new.current_board.invert["O "]
      turn_new.computer_move(Board.new({}).empty_board)
      test4 = turn_new.current_board.invert["O "]
      turn_new.computer_move(Board.new({}).empty_board)
      test5 = turn_new.current_board.invert["O "]
      tests = [test1, test2, test3, test4, test5]
      tests_with_key = Hash.new(0)
      tests.each do |test|
        tests_with_key.store(test, tests_with_key[test]+1)
      end
      expect(tests_with_key.values.find_all{|match| match >= 4}).to eq([])
    end

  end


  context "end_game" do
    it "declares winner player column" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      4.times do
        turn.player_1_move("G", current_board)
      end

      expect(turn.end_game?(current_board)).to eq(true)

    end


    it "declares winner computer column" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      current_board[:B1] = "O "
      current_board[:B2] = "O "
      current_board[:B3] = "O "
      current_board[:B4] = "O "

      expect(turn.end_game?(current_board)).to eq(true)
    end


    it "declares winner computer row" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      current_board[:B1] = "O "
      current_board[:C1] = "O "
      current_board[:D1] = "O "
      current_board[:E1] = "O "

      expect(turn.end_game?(current_board)).to eq(true)
    end



    it "declares winner player row" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      turn.player_1_move("A", current_board)
      turn.player_1_move("B", current_board)
      turn.player_1_move("C", current_board)
      turn.player_1_move("D", current_board)
      expect(turn.end_game?(current_board)).to eq(true)
    end


    it "declares winner computer diagnal up" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      current_board[:B1] = "O "
      current_board[:C2] = "O "
      current_board[:D3] = "O "
      current_board[:E4] = "O "

      expect(turn.end_game?(current_board)).to eq(true)
    end

    it "declares winner player diagnal up" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      current_board[:B1] = "X "
      current_board[:C2] = "X "
      current_board[:D3] = "X "
      current_board[:E4] = "X "
      expect(turn.end_game?(current_board)).to eq(true)
    end


    it "declares winner computer diagnal down" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      current_board[:B4] = "O "
      current_board[:C3] = "O "
      current_board[:D2] = "O "
      current_board[:E1] = "O "

      expect(turn.end_game?(current_board)).to eq(true)
    end

    it "declares winner player diagnal down" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      current_board[:B4] = "X "
      current_board[:C3] = "X "
      current_board[:D2] = "X "
      current_board[:E1] = "X "
      expect(turn.end_game?(current_board)).to eq(true)
    end


    it "declares draw" do
      turn = Turn.new
      current_board = Board.new({}).empty_board
      draw_board = {}
      current_board.each do |k, v|
          draw_board[k] = "X "
      end
      expect(turn.end_game_draw?(draw_board)).to eq(true)
    end


  end

end
