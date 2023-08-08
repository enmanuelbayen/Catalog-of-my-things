require_relative 'item'

class Book < Item
  attr_accessor :author, :cover_state

  def initialize(title, published_date, author, cover_state)
    super(title, published_date)
    @author = author
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == "bad"
  end
end
