class Board

  attr_reader :welcome_message, :board

  def initialize
    @welcome_message = "Welcome to Connect4!"
    @board = board
  end

  def display_board

    puts @welcome_message
    @board = [
              ["A", "B", "C", "D", "E", "F", "G"],
              [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."]
    ]

    @board.each do |row|
      row.each do |columns|
        print columns.to_s + " "
      end
      puts
    end
  end

end

game1 = Board.new
game1.display_board
