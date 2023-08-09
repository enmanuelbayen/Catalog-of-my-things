require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def run
    action = 0
    puts 'Welcome to our application!'
    while action != 10
      display_actions
      action = gets.chomp.to_i
      @app.handle_action(action)
    end
    @app.save_data
    puts 'Thank you for using our application.'
  end
end

Main.new.run
