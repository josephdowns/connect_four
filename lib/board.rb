class Board

  attr_reader :welcome_message, :table

  def initialize
    # @welcome_message = welcome_message
    @table = Matrix[ [7, 6, 1], [4, 5, 6]]
    puts @table

  # @welcome_message= "Welcome to Connect4!
  # ABCDEFG
  # .......
  # .......
  # .......
  # .......
  # .......
  # ......."
  end
end
