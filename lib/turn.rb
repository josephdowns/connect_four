require 'pry'

class Turn
  attr_reader :empty_board, :current_board
  def initialize

  end

#this method determines the next (if any) available cell and updates
  def player_move(column_selected, current_board)
      column = column_selected.upcase
      current_column = {}
      @current_board = current_board #initialize current board with empty
      column_name = ["A", "B", "C", "D", "E", "F","G" ]

      if !column_name.include?column
         # puts "ABCDEFG"
         Board.new(current_board).print_board
         puts "Invalid column selected. Please try again (A-G)"
         # $stdin.gets.chomp
      elsif column_name.include?column
# start with empty board update and print board after each move

       #this block finds and return the user selected column
          @current_board.each do |key, value|
            if key.to_s.include?column
              current_column[key] = value
            end
          end

          # in the selected column, only replaces a . when there is still one available
          if current_column.values.include?'.'
               current_cell = current_column.find do |key, value| ###
                                value == '.'
                              end
               current_cell_index = current_cell[0]
            @current_board[current_cell_index] = 'x'
            # binding.pry
            Board.new(@current_board).print_board
          else
            # if no cell available prompt to select again
            Board.new(@current_board).print_board
            puts "***Column full-select another column***"
          end

      end # if.. elsif ..line 16 and 21
  end #player_move end


  def computer_move(current_board)




  end


  def end_game?(current_board)
    @current_board = current_board



  end



end
