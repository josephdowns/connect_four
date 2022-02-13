require './lib/board'
require './lib/turn'

    puts "Welcome to Connect Four!"
    puts "Enter 'p' to play. Enter 'q' to quit."
    puts ""
    print "> "
    menu_selection = $stdin.gets.chomp.upcase

    until menu_selection == "P" || menu_selection == "Q" do
      puts "Invalid selection. Try again!"
      puts ""
      print "> "
      menu_selection = $stdin.gets.chomp.upcase
    end


    if menu_selection == "P"
          puts ""
          puts "-"*10 + "Game Start" + "-"*10
          turn_init = Turn.new
          puts ""
          puts "ABCDEFG"
          empty_board = Board.new({}).empty_board
          Board.new(empty_board).print_board
          puts ""
          puts "Select your first column from A-G"

          current_board = empty_board
          while turn_init.end_game?(current_board) == false do
            puts ""
            print "> "
            column_selected = $stdin.gets.chomp
            turn_init.player_move(column_selected, current_board)
            current_board = turn_init.current_board
            if turn_init.end_game?(current_board) == true
              puts ""
              break
            end
            puts ""
            puts "*"*5 + "My turn! Give me a sec..." + "*"*5
            turn_init.computer_move(current_board)
            current_board = turn_init.current_board
            if turn_init.end_game?(current_board) == true
              puts ""
              break
            end
            puts ""
            puts "*"*5 + "Your turn! Select a column" + "*"*5
          end
    elsif menu_selection == "Q"
      puts "Maybe next time! Bye!"
    end
