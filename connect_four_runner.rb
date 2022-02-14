require './lib/board'
require './lib/turn'
require './lib/game'

    puts "Welcome to Connect Four!"
    puts "Enter 'p' to play. Enter 'q' to quit."
    puts ""
    print "> "
    menu_selection = $stdin.gets.chomp.upcase.strip

    until menu_selection == "P" || menu_selection == "Q" do
      puts "Invalid selection. Try again!"
      puts ""
      print "> "
      menu_selection = $stdin.gets.chomp.upcase.strip
    end


    if menu_selection == "P"
          Game.new.start
    elsif menu_selection == "Q"
      puts ""
      puts "Maybe next time! Bye!"
    end
