require 'pry'

class Turn
  attr_reader :empty_board, :current_board
  def initialize
    @column_name = ["A", "B", "C", "D", "E", "F","G" ]
  end


  def player_move(column_selected, input_board)
      column = column_selected.upcase
      current_column = {}
      @current_board = input_board

      if !@column_name.include?column
         puts "Invalid column selected. Please try again (A-G)"
         cs = $stdin.gets.chomp
         puts ""
         puts "ABCDEFG"
         Board.new(@current_board).print_board
         player_move(cs, @current_board)
      elsif @column_name.include?column
          @current_board.each do |key, value|
            if key.to_s.include?column
              current_column[key] = value
            end
          end

          if current_column.values.include?'.'
            current_cell =  current_column.find do |key, value| ###
                            value == '.'
                            end
            current_cell_index = current_cell[0]
            @current_board[current_cell_index] = 'x'
            puts ""
            puts "ABCDEFG"
            Board.new(@current_board).print_board
          else
            puts ""
            puts "ABCDEFG"
            Board.new(@current_board).print_board
            puts ""
            puts "***Column full-select another column***"
            puts ""
            print "> "
            cs = $stdin.gets.chomp
            player_move(cs, @current_board)
          end

      end
  end



  def computer_move(input_board)
    sleep([0.5, 1].sample)
    column_cpu = @column_name.sample
    @current_column = {}
    @current_board = input_board
    @current_board.each do |key, value|
      if key.to_s.include?column_cpu
        @current_column[key] = value
      end
    end

    until @current_column.values.include?'.' do
      computer_move(input_board)
    end

    current_cell =  @current_column.find do |key, value| ###
                    value == '.'
                    end
    current_cell_index = current_cell[0]
    @current_board[current_cell_index] = 'o'
    puts ""
    puts "ABCDEFG"
    Board.new(@current_board).print_board

  end

  def end_game?(input_board)
    @current_board = input_board
    row_names = ['6','5','4','3','2','1']
    rows = []
    row_names.each do |row|
      current_row_selected = {}
      @current_board.each do |key, value|
        if key.to_s.include?row
          current_row_selected[key] = value
        end
      end
      rows << current_row_selected
    end



    column_names = ['A','B','C','D','E','F', 'G']
    columns = []
    column_names.each do |column|
      current_column_selected = {}
      @current_board.each do |key, value|
        if key.to_s.include?column
          current_column_selected[key] = value
        end
      end
      columns << current_column_selected
    end

    endcounterrow = 0
    endcountercolumn = 0

    until endcounterrow == 6 do
      if rows[endcounterrow].values.join.include?("xxxx") == true
        puts ""
        puts "You win!"
        return true
      elsif rows[endcounterrow].values.join.include?("oooo") == true
        puts ""
        puts "You lose. I win!"
        return true
      else
      end
      endcounterrow += 1
    end

    until endcountercolumn == 7 do
      if columns[endcountercolumn].values.join.include?("xxxx") == true
        puts ""
        puts "You win!"
        return true
      elsif columns[endcountercolumn].values.join.include?("oooo") == true
        puts ""
        puts "You lose. I win!"
        return true
      else
      end
      endcountercolumn += 1
    end


  end


end
