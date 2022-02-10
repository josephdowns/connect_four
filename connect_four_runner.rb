require './lib/board'
require './lib/turn'

# binding.pry
    puts "Welcome to Collect Four!"
    puts "-"*10 + "Game Start" + "-"*10
    puts "ABCDEFG"
    board_init = Board.new({}) #start with empty hash
    turn_init = Turn.new #initialize a turn class
    empty_board = board_init.empty_board #fetch empty_board stored
    # binding.pry
    puts "Select column from A-G"
    Board.new(empty_board).print_board

    column_name = ["A", "B", "C", "D", "E", "F","G", "a", "b", "c", "d", "e", "f", "g"]
    current_board =empty_board
    while current_board.values.any?"." do #change condition to if end
      puts "-"*5 + "Select next column" + "-"*5
      user_response =$stdin.gets.chomp
      if column_name.include?user_response
        turn_init.player_move(user_response, current_board)
        current_board = turn_init.current_board
      else
          puts "Invalid Column. Please try again (A-G)"
          user_response = $stdin.gets.chomp
      end

    end
