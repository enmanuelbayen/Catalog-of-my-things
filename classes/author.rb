require 'securerandom'

class Author
  attr_reader :id, :name, :items

  def initialize(name, id = SecureRandom.random_number(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end