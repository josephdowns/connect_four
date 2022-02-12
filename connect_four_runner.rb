require './lib/board'
require './lib/turn'

    puts "Welcome to Collect Four!"
    puts "Enter p to play. Enter q to quit"
    menu_selection = $stdin.gets.chomp.upcase

    until menu_selection == "P" || menu_selection == "Q" do
      puts "Invalid selection. Try again!"
      menu_selection = $stdin.gets.chomp.upcase
    end


    if menu_selection == "P"
          puts "-"*10 + "Game Start" + "-"*10
          turn_init = Turn.new
          puts "ABCDEFG"
          empty_board = Board.new({}).empty_board
          Board.new(empty_board).print_board
          puts "Select your first column from A-G"

          current_board = empty_board
          while current_board.values.any?"." do
            column_selected = $stdin.gets.chomp
            turn_init.player_move(column_selected, current_board)
            current_board = turn_init.current_board
            puts "*"*5 + "My turn! Give me a sec..." + "*"*5
            turn_init.computer_move(current_board)
            current_board = turn_init.current_board
            puts "*"*5 + "Your turn! Select a column" + "*"*5
          end
    elsif menu_selection == "Q"
      puts "Maybe next time! Bye!"
    end
