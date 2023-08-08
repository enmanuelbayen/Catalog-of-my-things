class Label
    attr_accessor :name, :items
  
    def initialize(name)
      @name = name
      @items = []
    end
  
    def add_item(item)
      item.add_label(self)
      @items << item
    end
  end
  