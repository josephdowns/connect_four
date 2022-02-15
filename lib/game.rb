require './lib/board'
require './lib/turn'

class Game

  def main_menu
    puts ""
    puts "-"*8 + "Main Menu" + "-"*8
    puts "Welcome to Connect Four!"
    puts "Enter 'p' to play. Enter 'q' to quit."
    puts ""
    print "> "
    menu_selection = $stdin.gets.chomp.upcase.strip

    until menu_selection == "P" || menu_selection == "Q" do
      puts "Invalid selection. Try again!"
      puts ""
      print "> "
      menu_selection = $stdin.gets.chomp.upcase.strip
    end

    if menu_selection == "P"
       Game.new.start
    elsif menu_selection == "Q"
      puts ""
      puts "Maybe next time! Bye!"
    end
  end

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
    initial_column = column_selected.dup
    initial_cell_key = ":".concat(initial_column.concat("1"))
    until turn_init.end_game_draw?(current_board) == true do

      valid = turn_init.valid_move?(column_selected)
      until valid == true do
        column_selected = $stdin.gets.chomp.strip
        valid = turn_init.valid_move?(column_selected)
      end
      turn_init.player_move(column_selected, current_board)
      current_board = turn_init.current_board
      current_cell = turn_init.current_cell[0].to_s
      if turn_init.end_game?(current_cell, current_board) == true
          puts ""
          break
      end
      puts ""
      puts "*"*5 + "My turn! Give me a sec..." + "*"*5
      cpu_move = turn_init.computer_move(current_board)
      current_board = turn_init.current_board
      current_cell = turn_init.current_cell[0].to_s

      if turn_init.end_game?(current_cell, current_board) == true
          puts ""
          break
      end
      puts ""
      puts "*"*5 + "Your turn! Select a column" + "*"*5
      puts ""
      print "> "
      column_selected = $stdin.gets.chomp.strip
    end
    main_menu
  end
end
