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
         Board.new(@current_board).print_board
         puts "Invalid column selected. Please try again (A-G)"
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
            Board.new(@current_board).print_board
          else
            Board.new(@current_board).print_board
            puts "***Column full-select another column***"
          end

      end
  end



  # def computer_move(input_board)
  #   column_cpu = @column_name.sample
  #   current_column = {}
  #   @current_board = input_board
  #
  #   # if !@column_name.include?column
  #   #    Board.new(@current_board).print_board
  #   #    puts "Invalid column selected. Please try again (A-G)"
  #
  #       @current_board.each do |key, value|
  #         if key.to_s.include?column_cpu
  #           current_column[key] = value
  #         end
  #       end
  #
  #       if current_column.values.include?'.'
  #         current_cell =  current_column.find do |key, value| ###
  #                         value == '.'
  #                         end
  #         current_cell_index = current_cell[0]
  #         @current_board[current_cell_index] = 'o'
  #         Board.new(@current_board).print_board
  #       else
  #         Board.new(@current_board).print_board
  #         puts "***Column full-select another column***"
  #       end
  #
  #   end
  #   end
  def end_game?(current_board)
    @current_board = current_board
    # call all rows
    row_names = ['1','2','3','4','5','6'].reverse #
    column_by_rows = []
    current_row = {}
    row_names.each do |row|
      current_row={}
      @current_board.each do |key, value|
        if key.to_s.include?row
          current_row[key] = value
        end
      end
      column_by_rows << current_row
    end

    #call all columns



    #call all diagnals that's greater than 4 pieces


end


end
