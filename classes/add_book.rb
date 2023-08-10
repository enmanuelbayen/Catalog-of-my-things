require_relative 'book'
require_relative 'label'
require 'date'

def add_book
  print 'Please, type the book title: '
  title = gets.chomp

  print 'Please, type the book publisher: '
  publisher = gets.chomp

  print 'Please, type the book cover state: '
  cover_state = gets.chomp

  print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
  publish_date = get_date_from_user(gets.chomp)
  return unless publish_date

  print 'Please, type the label color: '
  label_color = gets.chomp

  book = Book.new(title: title, publisher: publisher, cover_state: cover_state, publish_date: publish_date)
  @items << book
  puts "#{title} has been added to the catalog."

  book_label = Label.new(title: title, color: label_color)
  @labels << book_label
end
