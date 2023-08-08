require_relative 'book'

def list_books(items)
  books = items.select { |item| item.is_a?(Book) }
  if books.empty?
    puts 'No books available.'
  else
    puts 'List of books:'
    books.each do |book|
      puts "- Title: #{book.title}"
      puts "  Publisher: #{book.publisher}"
      puts "  Cover State: #{book.cover_state}"
      puts "  Publish Date: #{book.publish_date}"
      puts "  ID: #{book.id}" # This line adds the ID
      puts '---'
    end
  end
end
