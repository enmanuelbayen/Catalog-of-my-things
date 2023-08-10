require './classes/genre'
require './classes/music'
require 'json'
require 'fileutils'

module DataManager
  DATA_FOLDER = 'json_files'.freeze

  def save_data_to_json(filename, data)
    serialized_data = data.map(&:to_h)
    File.write(File.join(DATA_FOLDER, "#{filename}.json"), JSON.pretty_generate(serialized_data))
  end

  def load_data_from_json(filename, klass)
    data_file_path = File.join(DATA_FOLDER, "#{filename}.json")
    serialized_data = JSON.parse(File.read(data_file_path), symbolize_names: true)

    serialized_data.map do |item_data|
      item_data[:publish_date] = Date.parse(item_data[:publish_date]) if item_data[:publish_date]
      klass.new(**item_data)
    end
  rescue Errno::ENOENT
    []
  end

  def load_genres
    genres_arr = []
    if File.exist?('./json_files/genre.json')
      genres_data = File.read('./json_files/genre.json')
      if genres_data != ''
        JSON.parse(genres_data).map do |genre|
          new_genre = Genre.new(genre['name'])
          new_genre.id = genre['id']
          genres_arr << new_genre
        end
      end
    end
    genres_arr
  end

  def load_music
    music_album_arr = []
    if File.exist?('./json_files/music_albums.json')
      music_album_data = File.read('./json_files/music_albums.json')
      if music_album_data != ''
        JSON.parse(music_album_data).map do |music_album|
          new_music_album = MusicAlbum.new(publish_date: music_album['publish_date'], id: music_album['id'])
          new_music_album.on_spotify = music_album['on_spotify']
          new_genre = @genre.find { |find_genre| find_genre.name == music_album['genre'] }
          new_genre.add_item(new_music_album)

          music_album_arr << new_music_album
        end
      end
    end
    music_album_arr
  end

  def save_music
    json_music_albums = []
    music_albums.each do |music_album|
      new_music_album = {
        publish_date: music_album.publish_date,
        id: music_album.id,
        on_spotify: music_album.on_spotify,
        genre: music_album.genre.name
      }
      json_music_albums << new_music_album
    end

    FileUtils.touch('./json_files/music_albums.json')
    File.write('./json_files/music_albums.json', JSON.pretty_generate(json_music_albums))
  end

  def save_genres
    json_genre = []
    genre.each do |genre|
      json_genre << { name: genre.name, id: genre.id }
    end

    FileUtils.touch('./json_files/genre.json')
    File.write('./json_files/genre.json', JSON.pretty_generate(json_genre))
  end
end
