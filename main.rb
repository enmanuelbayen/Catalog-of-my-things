require_relative 'item'
require_relative 'book'
require_relative 'label'
require_relative 'list_books'
require_relative 'list_labels'
require 'date'

class Main
  def initialize
    @items = []
    @labels = []
  end

  def print_options
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts 'Glad to see you again buddy!'
    puts 'Please choose an option by entering a number:'
    puts '1.- List  music albums'
    puts '2.- List  books'
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
    if option.between?(1, 12)
      case option
      when 1
        # Implement option 1
      when 2
        list_books(@items)
      when 5
        list_all_labels(@labels)
      when 8
        add_book(@items, @labels)
      when 12
        exit_catalog
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

  def exit_catalog
    puts 'Exiting catalog. Goodbye!'
    exit
  end

  def add_book(items, labels)
    print 'Please, type the book title: '
    title = gets.chomp

    print 'Please, type the book publisher: '
    publisher = gets.chomp

    print 'Please, type the book cover state: '
    cover_state = gets.chomp

    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = get_date_from_user(gets.chomp)
    return unless publish_date

    book = Book.new(title: title, publisher: publisher, cover_state: cover_state, publish_date: publish_date)
    items << book
    puts "#{title} has been added to the catalog."

    book_label = Label.new(title: title, id: nil) # Provide an id here
    labels << book_label
  end

  private

  def get_date_from_user(date_string)
    Date.parse(date_string)
  rescue ArgumentError
    puts 'Invalid date format. Please use the format (yyyy-mm-dd).'
    nil
  end
end

Main.new.main
