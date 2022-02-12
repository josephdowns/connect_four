require "pry"
input_board = { A1:"x", B1:"x", C1:"x", D1:"x", E1:"x", F1:"x", G1:"x",
                A2:".", B2:".", C2:".", D2:".", E2:".", F2:".", G2:".",
                A3:".", B3:".", C3:".", D3:".", E3:".", F3:".", G3:".",
                A4:".", B4:".", C4:".", D4:".", E4:".", F4:".", G4:".",
                A5:".", B5:".", C5:".", D5:".", E5:".", F5:".", G5:".",
                A6:".", B6:".", C6:".", D6:".", E6:".", F6:".", G6:"."}


column_name = ["A", "B", "C", "D", "E", "F", "G"]

column_cpu = column_name.sample
current_column = {}
current_board = input_board
current_board.each do |key, value|
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
current_board[current_cell_index] = 'o'
binding.pry
print current_board
# Board.new(@current_board).print_board
