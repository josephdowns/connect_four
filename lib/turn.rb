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
            puts "ABCDEFG"
            Board.new(@current_board).print_board
          else
            puts "ABCDEFG"
            Board.new(@current_board).print_board
            puts "***Column full-select another column***"
            cs = $stdin.gets.chomp
            player_move(cs, @current_board)
          end

      end
  end



  def computer_move(input_board)
    sleep([0.5, 1].sample)
    column_cpu = @column_name.sample
    current_column = {}
    @current_board = input_board
    @current_board.each do |key, value|
      if key.to_s.include?column_cpu
        current_column[key] = value
      end
    end

    until current_column.values.include?'.' do
        @column_name.sample
    end

    current_cell =  current_column.find do |key, value| ###
                    value == '.'
                    end
    current_cell_index = current_cell[0]
    @current_board[current_cell_index] = 'o'
    puts "ABCDEFG"
    Board.new(@current_board).print_board

  end

  def end_game?(current_board)
    @current_board = current_board


    # # call all rows
    # row_names = ['1','2','3','4','5','6'].reverse #
    # column_by_rows = []
    # current_row = {}
    # row_names.each do |row|
    #   current_row={}
    #   @current_board.each do |key, value|
    #     if key.to_s.include?row
    #       current_row[key] = value
    #     end
    #   end
    #   column_by_rows << current_row
    # end

    #call all column






    ############################################### diagonal condition
    cb = @current_board
    @DU1 = [] ; @DU2 = []; @DU3 = []; @DU4 = []; @DU5 = []; @DU6 = []
    @@DD1 = [] ; @@DD2 = []; @DD3 = []; @DD4 = []; @DD5 = []; @DD6 = []

    @DU1 = [cb[:A1], cb[:B2], cb[:C3], cb[:D4], cb[:E5], cb[:F6]]
    @DU2 = [cb[:B1], cb[:C2], cb[:D3], cb[:E4], cb[:F5], cb[:G6]]
    @DU3 = [cb[:C1], cb[:D2], cb[:E3], cb[:F4], cb[:G5]]
    @DU4 = [cb[:D1], cb[:E2], cb[:F3], cb[:G4]]
    @DU5 = [cb[:A2], cb[:B3], cb[:C4], cb[:E5], cb[:G6]]
    @DU6 = [cb[:A3], cb[:B4], cb[:D5], cb[:E6]]
    @DD1 = [cb[:G1], cb[:F2], cb[:E3], cb[:D4], cb[:C5], cb[:B6]]
    @DD2 = [cb[:F1], cb[:E2], cb[:D3], cb[:C4], cb[:B5], cb[:A6]]
    @DD3 = [cb[:E1], cb[:D2], cb[:C3], cb[:B4], cb[:A5]]
    @DD4 = [cb[:D1], cb[:C2], cb[:B3], cb[:A4]]
    @DD5 = [cb[:G2], cb[:F3], cb[:E4], cb[:D5], cb[:C6]]
    @DD6 = [cb[:G3], cb[:F4], cb[:E5], cb[:D6]]

    diagonal_lines = [@DU1, @DU2, @DU3, @DU4, @DU5, @DU6, @DD1, @DD2, @DD3, @DD4, @DD5, @DD6]
    diagonal_lines.each do |line|
      if line.join.include?'xxxx'
        puts "You win!"
        return "You win!"
      elsif line.join.include?'oooo'
        puts "You lose."
        return "You lose."
      end
    end


    ##################################### draw condition
    if current_board.values.none?'.'
      puts "Draw!"
      return "Draw!"
    end

  end


end
