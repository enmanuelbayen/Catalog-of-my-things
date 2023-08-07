require_relative 'item'

class Main
  def initialize
    @item = Item.new
  end

  def print_options
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts 'Glad to see you again buddy!'
    puts 'Please choose an option by entering a number:'
    puts '1.- List  music albums'
    puts '2.- List  movies'
    puts '3.- List of games'
    puts '4.- List  genres'
    puts '5.- List  labels'
    puts '6.- List  authors'
    puts '7.- List  sources'
    puts '8.- Add a book'
    puts '9.- Add a music album'
    puts '10.- Add a movie'
    puts '11.- Add a game'
    puts '12.- Exit catalog'
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  end

  def operator(option)
    if option.between?(1)
      case option
      when 1
        @item.add_related_item
        # repeat until have all 12 options passed
      end
    else
      puts 'Error: Invalid number, try again'
    end
  end

  def main
    loop do
      print_options
      option = gets.chomp.to_i
      operator(option)
      break if option == 12
    end
  end
end

Main.new.main
