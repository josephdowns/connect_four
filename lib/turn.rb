require 'pry'

class Turn
  attr_reader :empty_board, :current_board
  def initialize
    @column_name = ["A", "B", "C", "D", "E", "F", "G"]
  end

  def gather_column(column_selected)
    column_selected = column_selected
    @current_column = {}
    # binding.pry
    @current_board.each do |key, value|
      if key.to_s.include?column_selected
        @current_column[key] = value
      end
    end
  end

  def valid_move?(column_selected)
    column_recieved = column_selected.upcase
    if !@column_name.include?column_recieved
      puts ""
      puts "Invalid column selected. Please try again (A-G)"
      puts ""
      print "> "
      return false
    elsif @column_name.include?column_recieved
      return true
    end
  end

  def column_full?(column_selected)
    column_selected = column_selected
    gather_column(column_selected)
    if @current_column.values.any?(".")
      return false
    else
      return true
    end
  end


  def player_move(column_selected, input_board)
      column_selected = column_selected.upcase
      @current_board = input_board
      cf = column_full?(column_selected)
# binding.pry
#######################################if valid move, places a piece
          if cf == false
            current_cell =  @current_column.find do |key, value| ###
                            value == '.'
                            end
            current_cell_index = current_cell[0]
            @current_board[current_cell_index] = 'x'
            Board.new(@current_board).print_board
          else cf == true
            Board.new(@current_board).print_board
            puts ""
            puts "***Column full-select another column***"
            puts ""
            print "> "
            cs = $stdin.gets.chomp
            player_move(cs, @current_board)
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
    Board.new(@current_board).print_board

  end



  def end_game?(input_board)
    @current_board = input_board
    ############################row condition
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

    endcounterrow = 0
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

    ###################################column condition
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

    endcountercolumn = 0
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




    ############################################### diagonal condition
    cb = @current_board
    @DU1 = [] ; @DU2 = []; @DU3 = []; @DU4 = []; @DU5 = []; @DU6 = []
    @DD1 = [] ; @DD2 = []; @DD3 = []; @DD4 = []; @DD5 = []; @DD6 = []

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
        return true
      elsif line.join.include?'oooo'
        puts "You lose."
        return true
      end
    end


    ##################################### draw condition
    if current_board.values.none?'.'
      puts "Draw!"
      return true
    end

  end


end
