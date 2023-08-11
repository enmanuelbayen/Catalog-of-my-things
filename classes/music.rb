require_relative 'item'
require_relative 'genre'
require_relative 'author'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, id = SecureRandom.random_number(1000))
    super(publish_date, id)
    @on_spotify = false
  end

  def self.list_all_music_albums(music_albums)
    if music_albums.empty?
      puts 'Add a new music album first!'
    else
      puts 'Full List of Music Albums: '
      music_albums.each_with_index do |music_album, index|
        puts "#{index}) ID: #{music_album.id}"
        puts "Title: #{music_album.label.title}"
        puts "Author: #{music_album.author.first_name} #{music_album.author.last_name}"
        puts "Genre: #{music_album.genre.name}"
        puts "Publish Date: #{music_album.publish_date}"
        puts '---'
      end
      puts
    end
  end

  def self.add_music_album(music_albums, genre, authors, labels)
    print '-Enter the title of the music album: '
    label_title = gets.chomp.capitalize
    print '-First Name of the author: '
    first_name = gets.chomp.capitalize
    print '-Last Name of the author: '
    last_name = gets.chomp.capitalize
    print '-Genre of the music album: '
    name_genre = gets.chomp.capitalize
    print '-Enter the music album color: '
    label_color = gets.chomp
    print '-Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp

    new_author = authors.find do |find_author|
      find_author.first_name == first_name && find_author.last_name == last_name
    end
    new_label = labels.find { |find_label| find_label.title == label_title && find_label.color == label_color }
    new_genre = genre.find { |find_genre| find_genre.name == name_genre }

    if new_label.nil?
      new_label = Label.new(label_title, label_color)
      labels << new_label
    end

    if new_genre.nil?
      new_genre = Genre.new(name_genre)
      genre << new_genre
    end

    if new_author.nil?
      new_author = Author.new(first_name, last_name)
      authors << new_author
    end

    new_music_album = MusicAlbum.new(publish_date)

    new_genre.add_item(new_music_album)
    new_author.add_item(new_music_album)
    new_label.add_item(new_music_album)

    music_albums << new_music_album
    puts 'Your music album has been added successfully'
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
