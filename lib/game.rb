require './lib/board'
require './lib/turn'
require 'pry'

class Game

  def main_menu
    puts ""
    puts "-"*8 + "Main Menu" + "-"*8
    puts ""
    puts "Welcome to Connect Four!"
    puts "Enter 'p' to play. Enter 'q' to quit."
    puts ""
    print "> "
    menu_selection = $stdin.gets.chomp.upcase.strip

    until menu_selection == "P" || menu_selection == "Q" do
      puts ""
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
    @current_board = empty_board
    column_selected = $stdin.gets.chomp.strip

    until turn_init.end_game_draw?(@current_board) == true do

      valid = turn_init.valid_move?(column_selected)

          until valid == true do
            column_selected = $stdin.gets.chomp.strip
            valid = turn_init.valid_move?(column_selected)
          end
          turn_init.player_move(column_selected, @current_board)
          Board.new(@current_board).print_board
          if turn_init.end_game?(@current_board) == true
              puts ""
              break
          end

          puts ""
          puts "*"*5 + "My turn! Give me a sec..." + "*"*5
          turn_init.computer_move(@current_board)
          Board.new(@current_board).print_board
          if turn_init.end_game?(@current_board) == true
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
