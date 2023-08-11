class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color, id = SecureRandom.random_number(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def self.list_all_labels(labels)
    if labels.empty?
      puts 'No labels available.'
    else
      puts 'List of all labels: '
      labels.each_with_index do |label, index|
        puts "#{index}) (ID: #{label.id}) Label: #{label.title}, Color: #{label.color}"
      end
      puts
    end
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end
end
