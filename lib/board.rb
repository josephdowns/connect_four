
require 'pry'
#
class Board
  attr_reader :board
  def initialize
    @board = [{A1:"x", B1:"x", C1:"x", D1:"x", E1:"x", F1:"x", G1:"x"},
              {A2:"x", B2:"x", C2:"x", D2:"x", E2:"x", F2:"x", G2:"x"},
              {A3:"x", B3:"x", C3:"x", D3:"x", E3:"x", F3:"x", G3:"x"},
              {A4:"x", B4:"x", C4:"x", D4:"x", E4:"x", F4:"x", G4:"x"},
              {A5:"x", B5:"x", C5:"x", D5:"x", E5:"x", F5:"x", G5:"x"},
              {A6:"x", B6:"x", C6:"x", D6:"x", E6:"x", F6:"x", G6:"x"}]


    @board.each do |row|
      row.each do |key, value|
       row[key] = "."
     end
    end
# binding.pry
    puts "Welcome to Collect Four!"
    puts "-"*10 + "Game Start" + "-"*10
    puts "ABCDEFG"

    @board.each do |row|
      puts row.values.join

    end

    puts "-"*5 + "Choose a row from A-G" + "-"*5
  end

  def move
  end

end
