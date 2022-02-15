require './lib/board'
require './lib/turn'
require 'pry'

class Game



  def print_prompts
    puts ""
    print "> "
  end

  def main_menu
    puts ""
    puts "-"*8 + "Main Menu" + "-"*8
    puts ""
    puts "Welcome to Connect Four!"
    puts "Enter 'p' to play. Enter 'q' to quit."
    print_prompts
    menu_selection = $stdin.gets.chomp.upcase.strip

    until menu_selection == "P" || menu_selection == "Q" do
      puts ""
      puts "Invalid selection. Enter p or q!"
      print_prompts
      menu_selection = $stdin.gets.chomp.upcase.strip
    end


    if menu_selection == "P"
      puts ""
      puts "Enter '1' for 1 player. Enter '2' for 2 players."
      print_prompts
      player_selection = $stdin.gets.chomp.upcase.strip
      until player_selection == "1" || player_selection == "2" do
        puts ""
        puts "Invalid selection. Enter 1 or 2!"
        print_prompts
        player_selection = $stdin.gets.chomp.upcase.strip
      end
      if player_selection == "1"
          Game.new.start_p1_vs_cpu
      elsif player_selection == "2"
          puts ""
          puts "Player 1, enter your name below:"
          print_prompts
          player_1 = $stdin.gets.chomp.strip
          puts ""
          puts "Player 2, enter your name below:"
          print_prompts
          player_2 = $stdin.gets.chomp.strip
          Game.new.start_p1_vs_p2(player_1, player_2)
      end
    elsif menu_selection == "Q"
      puts ""
      puts "Maybe next time! Bye!"
    end
  end


  def start_p1_vs_cpu
    puts ""
    puts "-"*10 + "Game Start" + "-"*10
    turn_init = Turn.new
    empty_board = Board.new({}).empty_board
    Board.new(empty_board).print_board
    puts ""
    puts "Select your first column from A-G"
    print_prompts
    @current_board = empty_board
    column_selected = $stdin.gets.chomp.strip

    until turn_init.end_game_draw?(@current_board) == true do

      valid = turn_init.valid_move?(column_selected)

          until valid == true do
            column_selected = $stdin.gets.chomp.strip
            valid = turn_init.valid_move?(column_selected)
          end
          turn_init.player_1_move(column_selected, @current_board)
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
          print_prompts
          column_selected = $stdin.gets.chomp.strip
    end
    main_menu
  end

  def start_p1_vs_p2(p1, p2)
    p1 = p1
    p2 = p2
    puts ""
    puts "-"*10 + "Game Start" + "-"*10
    turn_init = Turn.new
    empty_board = Board.new({}).empty_board
    Board.new(empty_board).print_board
    puts ""
    puts "#{p1}, select your first column from A-G"
    print_prompts
    @current_board = empty_board
    column_selected_1 = $stdin.gets.chomp.strip

    until turn_init.end_game_draw?(@current_board) == true do
          valid = turn_init.valid_move?(column_selected_1)
          until valid == true do
            column_selected_1 = $stdin.gets.chomp.strip
            valid = turn_init.valid_move?(column_selected_1)
          end
          turn_init.player_1_move(column_selected_1, @current_board)
          Board.new(@current_board).print_board
          if turn_init.end_game_2p?(p1, p2, @current_board) == true
              puts ""
              break
          end

          puts ""
          puts "#{p2}, your turn!"
          print_prompts
          column_selected_2 = $stdin.gets.chomp.strip
          valid = turn_init.valid_move?(column_selected_2)
          until valid == true do
            column_selected_2 = $stdin.gets.chomp.strip
            valid = turn_init.valid_move?(column_selected_2)
          end
          turn_init.player_2_move(column_selected_2, @current_board)
          Board.new(@current_board).print_board
          if turn_init.end_game_2p?(p1, p2, @current_board) == true
              puts ""
              break
          end
          put ""
          puts "#{p1}, make your next move."
          print_prompts
          column_selected_1= $stdin.gets.chomp.strip
    end
    main_menu
  end


end
