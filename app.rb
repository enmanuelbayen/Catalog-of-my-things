require_relative 'classes/item'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/music'
require_relative 'classes/genre'
require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'moduls/load_data_manager'
require_relative 'moduls/save_data_manager'
require 'date'

class App
  include LoadData
  include SaveData
  attr_accessor :music_albums, :genre, :authors, :games, :labels, :books

  def initialize
    @labels = load_labels
    @genre = load_genres
    @authors = load_authors
    @games = load_games
    @books = load_books
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
        Book.list_books(books)
      when 3
        Game.list_all_games(games)
      when 4
        Genre.list_all_genres(genre)
      when 5
        Label.list_all_labels(labels)
      when 6
        Author.list_all_authors(authors)
      when 7
        Book.add_books(books, genre, authors, labels)
        save_books
        save_genres
        save_authors
        save_labels
      when 8
        MusicAlbum.add_music_album(music_albums, genre, authors, labels)
        save_music
        save_genres
        save_authors
        save_labels
      when 9
        Game.add_games(games, genre, authors, labels)
        save_games
        save_genres
        save_authors
        save_labels
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
    exit
  end

  private

  def get_date_from_user(date_string)
    Date.parse(date_string)
  rescue ArgumentError
    puts 'Invalid date format. Please use the format (yyyy-mm-dd).'
    nil
  end
end

App.new.main
