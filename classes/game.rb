require_relative 'item'
require_relative 'author'
require_relative 'genre'
require 'securerandom'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.list_all_games(games)
    index = 1
    if games.empty?
      puts 'No Games found'
    else
      puts 'List of all games: '
      games.each do |game|
        next unless game.instance_of? Game

        puts "#{index}) (ID:#{game.id})"
        puts "The game: #{game.label.title}"
        puts "Author: #{game.author.first_name} #{game.author.last_name}"
        puts "Genre: #{game.genre.name}"
        puts "Publish Date: #{game.publish_date}"
        puts '---'
        index += 1
      end
    end
  end

  def self.add_games(games, genre, authors, labels)
    print 'Enter title of the game: '
    label_title = gets.chomp.capitalize
    print 'The games creator first name: '
    author_first_name = gets.chomp.capitalize
    print 'The game creator last name: '
    author_last_name = gets.chomp.capitalize
    print 'Enter the game genre: '
    genre_name = gets.chomp.capitalize

    # item inputs
    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    game_date = gets.chomp
    print 'Is it a multiplayer game? [y/n]'
    game_multiplayer = gets.chomp
    multiplayer_answer = case game_multiplayer.downcase
                         when 'y'
                           true
                         else
                           false
                         end
    print 'When was the game last played? - '
    last_played = gets.chomp.to_i
    print 'Enter the game color: '
    label_color = gets.chomp

    new_game = Game.new(multiplayer_answer, last_played, game_date)

    new_author = authors.find do |find_author|
      find_author.first_name == author_first_name && find_author.last_name == author_last_name
    end
    new_genre = genre.find { |find_genre| find_genre.name == genre_name }
    new_label = labels.find { |find_label| find_label.title == label_title && find_label.color == label_color }

    if new_genre.nil?
      new_genre = Genre.new(genre_name)
      genre << new_genre
    end

    if new_author.nil?
      new_author = Author.new(author_first_name, author_last_name)
      authors << new_author
    end

    if new_label.nil?
      new_label = Label.new(label_title, label_color)
      labels << new_label
    end

    new_genre.add_item(new_game)
    new_author.add_item(new_game)
    new_label.add_item(new_game)

    games << new_game
    puts 'Your game has been added successfully'
  end

  private

  def can_be_archived?
    super && last_played_at_is_older_than_two_years?
  end

  def last_played_at_is_older_than_two_years?
    current_year = Time.new.year
    current_year - @last_played_at[:year] > 2
  end
end
