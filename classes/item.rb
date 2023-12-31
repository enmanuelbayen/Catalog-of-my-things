require 'securerandom'
require_relative 'label'

class Item
  attr_reader :genre, :author, :label, :publish_date, :id
  attr_accessor :archived

  def initialize(publish_date, id = SecureRandom.random_number(1..1000))
    @publish_date = publish_date
    @archived = false
    @id = id
  end

  def add_genre(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    @author.add_item(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    @label.add_item(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    current_year - @publish_date[:year] > 10
  end
end
