class Label
  attr_accessor :title
  attr_reader :id, :items

  def initialize(title:, id: SecureRandom.random_number(1..1000))
    @id = id
    @title = title
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
