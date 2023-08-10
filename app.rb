require_relative 'classes/item'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/list_books'
require_relative 'classes/add_book'
require_relative 'classes/list_labels'
require_relative 'classes/music'
require_relative 'classes/genre'
require_relative 'moduls/data_manager'
require 'date'

class App
  include DataManager
  attr_accessor :music_albums, :genre

  def initialize
    @genre = load_genres
    @labels = load_data_from_json('labels', Label)
    @items = load_data_from_json('items', Book)
    @music_albums = load_music
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
    puts '7.- Add a book'
    puts '8.- Add a music album'
    puts '9.- Add a game'
    puts '10.- Exit catalog'
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  end

  def operator(option)
    if option.between?(1, 10)
      case option
      when 1
        MusicAlbum.list_all_music_albums(music_albums)
      when 2
        list_books(@items)
      when 3
        # Implement option 1
      when 4
        Genre.list_all_genres(genre)
      when 5
        list_all_labels(@labels)
      when 6
        # Implement option
      when 7
        add_book
      when 8
        MusicAlbum.add_music_album(music_albums, genre)
        save_music
        save_genres
      when 9
        # Implement option
      when 10
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
      break if option == 10
    end
  end

  def exit_catalog
    puts 'Exiting catalog. Goodbye!'
    save_data
    exit
  end

  private

  def save_data
    save_data_to_json('items', @items)
    save_data_to_json('labels', @labels)
  end

  def get_date_from_user(date_string)
    Date.parse(date_string)
  rescue ArgumentError
    puts 'Invalid date format. Please use the format (yyyy-mm-dd).'
    nil
  end
end

App.new.main
