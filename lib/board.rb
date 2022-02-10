
require 'pry'
#
class Board
  attr_reader :board
  def initialize
    #board reformatted upside down
    @board = [{A6:".", B6:".", C6:".", D6:".", E6:".", F6:".", G6:"."},
              {A5:".", B5:".", C5:".", D5:".", E5:".", F5:".", G5:"."},
              {A4:".", B4:".", C4:".", D4:".", E4:".", F4:".", G4:"."},
              {A3:".", B3:".", C3:".", D3:".", E3:".", F3:".", G3:"."},
              {A2:".", B2:".", C2:".", D2:".", E2:".", F2:".", G2:"."},
              {A1:".", B1:".", C1:".", D1:".", E1:".", F1:".", G1:"."}]


    def print_board
      @board.each do |row|
        puts row.values.join

      end
    end

    # puts "-"*5 + "Choose a row from A-G" + "-"*5
  end

  def move(column)



  end

end
