require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date:, id: SecureRandom.random_number(1000))
    super(publish_date: publish_date, id: id)
    @on_spotify = false
  end

  def self.list_all_music_albums(music_albums)
    if music_albums.empty?
      puts 'Add a new music album first!'
    else
      puts 'Full List of Music Albums: '
      music_albums.each_with_index do |music_album, index|
        puts "#{index}) ID: #{music_album.id}"
        puts "Genre: #{music_album.genre.name}"
        puts "Publish Date: #{music_album.publish_date}"
        puts '---'
      end
      puts
    end
  end

  def self.add_music_album(music_albums, genre)
    print 'Genre of the music album: '
    name_genre = gets.chomp.capitalize
    print 'Publish Date (yyyy-mm-dd): '
    publish_date = gets.chomp
    new_genre = genre.find { |find_genre| find_genre.name == name_genre }
    new_music_album = MusicAlbum.new(publish_date: publish_date)

    if new_genre.nil?
      new_genre = Genre.new(name_genre)
      genre << new_genre
    end

    new_genre.add_item(new_music_album)
    music_albums << new_music_album
    puts 'Your music album has been created successfully'
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
