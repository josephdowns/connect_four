require './lib/board'
# binding.pry
    puts "Welcome to Collect Four!"
    puts "-"*10 + "Game Start" + "-"*10
    puts "ABCDEFG"

    game = Board.new
    puts "-"*5 + "Choose a row from A-G" + "-"*5

user_response = $stdin.gets.chomp
column_name = ["A", "B", "C", "D", "E", "F","G"]

if column_name.include?(user_response) || column_name.map(&:downcase).include?(user_response)
  game.move ## TEMP
end

until column_name.include?(user_response) || column_name.map(&:downcase).include?(user_response) do
  puts "Invalid row. Please try again (A-G)"
  user_response = $stdin.gets.chomp
end
