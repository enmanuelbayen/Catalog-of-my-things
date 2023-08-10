require 'securerandom'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name, id = SecureRandom.random_number(1..1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.list_all_authors(authors)
    if authors.empty?
      puts 'Authors is empty'
    else
      filtered_authors = []
      authors.each do |author|
        filtered_authors << author unless filtered_authors.any? do |a|
                                            a.first_name == author.first_name && a.last_name == author.last_name
                                          end
      end
      puts 'List of all authors: '
      filtered_authors.each_with_index do |author, index|
        puts "#{index}) (ID: #{author.id}) Author: #{author.first_name} #{author.last_name}"
      end
      puts
    end
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end
end
