
require "pry"
#
class Board
  attr_reader :board, :empty_board
  def initialize(board)
    @board = board
    @empty_board ={ A1:". ", B1:". ", C1:". ", D1:". ", E1:". ", F1:". ", G1:".",
                    A2:". ", B2:". ", C2:". ", D2:". ", E2:". ", F2:". ", G2:".",
                    A3:". ", B3:". ", C3:". ", D3:". ", E3:". ", F3:". ", G3:".",
                    A4:". ", B4:". ", C4:". ", D4:". ", E4:". ", F4:". ", G4:".",
                    A5:". ", B5:". ", C5:". ", D5:". ", E5:". ", F5:". ", G5:".",
                    A6:". ", B6:". ", C6:". ", D6:". ", E6:". ", F6:". ", G6:"."}
    return
    end

  def print_board
        puts ""
        puts "A B C D E F G"
        rows = ["1","2","3","4","5","6"].reverse
        rows.each do |row|
          current_row = {}
          @board.each do |key, value|
            if key.to_s.include?row
              current_row[key] = value
            end
          end
          puts current_row.values.join
        end
  end


end
