class Label
  attr_accessor :title
  attr_reader :id, :items

  def initialize(id: SecureRandom.random_number(1..1000), title:)
    @id = id
    @title = title
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
