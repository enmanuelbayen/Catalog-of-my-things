class Item
  attr_reader :title, :published_date, :archived

  def initialize(title, published_date)
    @title = title
    @published_date = published_date
    @archived = false
    @related_items = []
  end

  def add_related_item(item)
    @related_items << item
  end

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts "#{@title} has been moved to the archive."
    else
      puts "#{@title} cannot be archived at this time."
    end
  end
end
