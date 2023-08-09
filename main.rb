require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def run
    action = 0
    puts 'Welcome to our application!'
    while action != 12
      display_actions
      action = gets.chomp.to_i
      @app.handle_action(action)
    end
    @app.save_data
    puts 'Thank you for using our application.'
  end

  def display_actions
    puts
    puts '1- List all music albums'
    puts '2- List all books'
    puts '3- List of games'
    puts '4- List all genres'
    puts '5- List all labels'
    puts '6- List all authors'
    puts '7- Add a book'
    puts '8- Add a music album'
    puts '9- Add a game'
    puts '10- Add a movie'
    puts '11- Add a game'
    puts '12- Exit'
  end
end

Main.new.run
