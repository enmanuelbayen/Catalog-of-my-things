require_relative '../item'
require 'securerandom'

class Game < Item
  attr_accessor :last_played_at

  def initialize(options = {})
    super({ year: options[:year] || Time.new.year })
    @id = SecureRandom.random_number(1..1000)
    @last_played_at = options[:last_played_at]
  end

  private

  def can_be_archived?
    super && last_played_at_is_older_than_two_years?
  end

  def last_played_at_is_older_than_two_years?
    current_year = Time.new.year
    current_year - @last_played_at[:year] > 2
  end
end
