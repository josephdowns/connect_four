require './lib/board'
require './lib/turn'

    puts "Welcome to Collect Four!"
    puts "-"*10 + "Game Start" + "-"*10
    turn_init = Turn.new
    puts "ABCDEFG"
    empty_board = Board.new({}).empty_board
    Board.new(empty_board).print_board
    puts "Select your first column from A-G"

    current_board = empty_board
    while current_board.values.any?"." do
      column_selected = $stdin.gets.chomp
      puts "ABCDEFG"
      turn_init.player_move(column_selected, current_board)
      current_board = turn_init.current_board
      puts "*"*5 + "Select another column" + "*"*5
    end
