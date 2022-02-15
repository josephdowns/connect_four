class Game


  def start
    puts ""
    puts "-"*10 + "Game Start" + "-"*10
    turn_init = Turn.new
    empty_board = Board.new({}).empty_board
    Board.new(empty_board).print_board
    puts ""
    puts "Select your first column from A-G"
    puts ""
    print "> "
    current_board = empty_board
    column_selected = $stdin.gets.chomp.strip
    # valid = turn_init.valid_move?(column_selected)

    until turn_init.end_game?(current_board) == true do

      valid = turn_init.valid_move?(column_selected)

              # turn_init.player_move(new_column_selected, current_board)
              # binding.pry

          until valid == true do
            column_selected = $stdin.gets.chomp.strip
            # Board.new(current_board).print_board
            valid = turn_init.valid_move?(column_selected)
            # binding.pry
          end
          turn_init.player_move(column_selected, current_board)
          current_board = turn_init.current_board
          if turn_init.end_game?(current_board) == true
              puts ""
              break
          end

          puts ""
          puts "*"*5 + "My turn! Give me a sec..." + "*"*5
          cpu_move = turn_init.computer_move(current_board)
          # puts "I chose #{cpu_move.current_cell_index}!"
          current_board = turn_init.current_board
          if turn_init.end_game?(current_board) == true
              puts ""
              break
          end
          puts ""
          puts "*"*5 + "Your turn! Select a column" + "*"*5
          puts ""
          print "> "
          column_selected = $stdin.gets.chomp.strip
    end
  end
end
