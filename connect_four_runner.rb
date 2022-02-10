require './lib/board'
require './lib/turn'

# binding.pry
    puts "Welcome to Collect Four!"
    puts "-"*10 + "Game Start" + "-"*10
    board_init = Board.new({}) #start with empty hash
    turn_init = Turn.new #initialize a turn class
    empty_board = board_init.empty_board #fetch empty_board stored
    # binding.pry
    Board.new(empty_board).print_board
    puts "Select your first column from A-G"

    column_name = ["A", "B", "C", "D", "E", "F","G", "a", "b", "c", "d", "e", "f", "g"]
    current_board =empty_board
    while current_board.values.any?"." do #change condition to if end
      user_response =$stdin.gets.chomp
      if column_name.include?user_response
        puts "ABCDEFG"
        turn_init.player_move(user_response, current_board)
        current_board = turn_init.current_board
        puts "*"*5 + "Select another column" + "*"*5
      else
         puts "ABCDEFG"
         puts "Invalid Column. Please try again (A-G)"
         user_response = $stdin.gets.chomp
      end

    end
