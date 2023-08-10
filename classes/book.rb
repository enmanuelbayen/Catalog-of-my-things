require_relative 'item'
require_relative 'label'
require_relative 'author'
require_relative 'genre'

class Book < Item
  attr_accessor :id, :publisher, :cover_state

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    if books.empty?
      puts 'No books available.'
    else
      puts 'List of books:'
      books.each do |book, index|
        puts "  #{index}) ID: #{book.id}"
        puts "- Title: #{book.label.title}"
        puts "  Publisher: #{book.publisher}"
        puts "  Cover State: #{book.cover_state}"
        puts "  Author: #{book.author.first_name} #{book.author.last_name}"
        puts "  Genre: #{book.genre.name}"
        puts "  Publish Date: #{book.publish_date}"
        puts '---'
      end
    end
  end

  def self.add_books(books, genre, authors, labels)
    print 'Please, type the book title: '
    label_title = gets.chomp.capitalize
    print 'The book creator first name: '
    author_first_name = gets.chomp.capitalize
    print 'The book creator last name: '
    author_last_name = gets.chomp.capitalize
    print 'Please, type the book publisher: '
    publisher_name = gets.chomp.capitalize
    print 'Please, type the book cover state: '
    cover_state = gets.chomp.capitalize
    print 'Genre of the book: '
    genre_name = gets.chomp.capitalize
    print 'Please, type the label color: '
    label_color = gets.chomp.capitalize
    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp

    new_book = Book.new(publisher_name, cover_state, publish_date)

    new_author = authors.find do |find_author|
      find_author.first_name == author_first_name && find_author.last_name == author_last_name
    end
    new_genre = genre.find { |find_genre| find_genre.name == genre_name }
    new_label = labels.find { |find_label| find_label.title == label_title && find_label.color == label_color }

    if new_author.nil?
      new_author = Author.new(author_first_name, author_last_name)
      authors << new_author
    end

    if new_genre.nil?
      new_genre = Genre.new(genre_name)
      genre << new_genre
    end

    if new_label.nil?
      new_label = Label.new(label_title, label_color)
      labels << new_label
    end

    new_genre.add_item(new_book)
    new_author.add_item(new_book)
    new_label.add_item(new_book)

    books << new_book
    puts "#{label_title} has been added to the catalog."
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
