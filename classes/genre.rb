require 'securerandom'
require_relative 'item'

class Genre
  attr_reader :name
  attr_accessor :id, :items

  def initialize(name, id = SecureRandom.random_number(1000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def self.list_all_genres(genres)
    if genres.empty?
      puts 'List of genre is empty...'
    else
      filtered_genres = []
      genres.each do |genre|
        filtered_genres << genre unless filtered_genres.any? { |g| g.name == genre.name }
      end
      puts 'List of all added genres: '
      filtered_genres.each_with_index do |genre, index|
        puts "#{index}) (ID: #{genre.id}) Genre: #{genre.name}"
      end
      puts
    end
  end
end
