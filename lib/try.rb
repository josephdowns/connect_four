row_num = ['H', '1','2','3','4','5','6']
col_name = ["A", "B", "C", "D", "E", "F","G"]
diagonal_array = []

# get lines up starting A1 B1 C1 D1
col_name.each do |col|
  diagonal_line = []
  i = 0
  6.times do
      cell = ''
      i += 1
      cell = col.concat(row_num[i-1])
      diagonal_line << cell
  end
  col_name.shift
  diagonal_array << diagonal_line

  require 'pry'; binding.pry
end
