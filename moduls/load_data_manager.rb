require './classes/author'
require './classes/book'
require './classes/label'
require './classes/genre'
require './classes/music'
require 'json'

module LoadData
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
          new_music_album = MusicAlbum.new(music_album['publish_date'], music_album['id'])
          new_music_album.on_spotify = music_album['on_spotify']
          new_author = authors.find do |find_author|
            find_author.first_name == music_album['first_name'] && find_author.last_name == music_album['last_name']
          end
          new_genre = genre.find { |find_genre| find_genre.name == music_album['genre'] }
          new_label = labels.find do |find_label|
            find_label.title == music_album['title'] && find_label.color == music_album['label_color']
          end

          new_genre.add_item(new_music_album)
          new_author.add_item(new_music_album)
          new_label.add_item(new_music_album)

          music_album_arr << new_music_album
        end
      end
    end
    music_album_arr
  end

  def load_authors
    authors_arr = []
    if File.exist?('./json_files/author.json')
      authors_data = File.read('./json_files/author.json')
      if authors_data != ''
        JSON.parse(authors_data).map do |author|
          new_author = Author.new(author['first_name'], author['last_name'], author['id'])
          authors_arr << new_author
        end
      end
    end
    authors_arr
  end

  def load_labels
    labels_arr = []
    if File.exist?('./json_files/labels.json')
      labels_data = File.read('./json_files/labels.json')
      if labels_data != ''
        JSON.parse(labels_data).map do |label|
          new_label = Label.new(label['label_title'], label['label_color'], label['id'])
          labels_arr << new_label
        end
      end
    end
    labels_arr
  end

  def load_games
    games_arr = []
    if File.exist?('./json_files/games.json')
      games_data = File.read('./json_files/games.json')
      if games_data != ''
        JSON.parse(games_data).map do |game|
          new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], game['id'])
          new_author = authors.find do |find_author|
            find_author.first_name == game['first_name'] && find_author.last_name == game['last_name']
          end
          new_genre = genre.find { |find_genre| find_genre.name == game['genre'] }
          new_label = labels.find do |find_label|
            find_label.title == game['title'] && find_label.color == game['label_color']
          end
          new_genre.add_item(new_game)
          new_author.add_item(new_game)
          new_label.add_item(new_game)
          games_arr << new_game
        end
      end
    end
    games_arr
  end

  def load_books
    books_arr = []
    if File.exist?('./json_files/books.json')
      books_data = File.read('./json_files/books.json')
      if books_data != ''
        JSON.parse(books_data).map do |book|
          new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
          new_book.id = book['id']
          new_author = authors.find do |find_author|
            find_author.first_name == book['first_name'] && find_author.last_name == book['last_name']
          end
          new_label = labels.find do |find_label|
            find_label.title == book['title'] && find_label.color == book['label_color']
          end
          new_genre = genre.find { |find_genre| find_genre.name == book['genre'] }
          new_genre.add_item(new_book)
          new_author.add_item(new_book)
          new_label.add_item(new_book)
          books_arr << new_book
        end
      end
    end
    books_arr
  end
end
