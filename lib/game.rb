class Game

  def initialize
  end

  def start
    puts ""
    puts "-"*10 + "Game Start" + "-"*10
    turn_init = Turn.new
    empty_board = Board.new({}).empty_board
    Board.new(empty_board).print_board
    puts ""
    puts "Select your first column from A-G"

    current_board = empty_board
    column_selected = $stdin.gets.chomp.strip
    # valid = turn_init.valid_move?(column_selected)

    until turn_init.end_game?(current_board) == true do

      valid = turn_init.valid_move?(column_selected)

          if valid == false
              new_column_selected = $stdin.gets.chomp.strip
              Board.new(current_board).print_board
              turn_init.player_move(new_column_selected, current_board)
              # binding.pry
          elsif valid == true
              turn_init.player_move(column_selected, current_board)
              current_board = turn_init.current_board
              if turn_init.end_game?(current_board) == true
                  puts ""
                  break
              end
          end
          puts ""
          puts "*"*5 + "My turn! Give me a sec..." + "*"*5
          turn_init.computer_move(current_board)
          # puts "I chose #{turn_init.computer_move.column_cpu}!"
          current_board = turn_init.current_board
          if turn_init.end_game?(current_board) == true
              puts ""
              break
          end
          puts ""
          puts "*"*5 + "Your turn! Select a column" + "*"*5

          column_selected = $stdin.gets.chomp.strip
    end
  end
end
