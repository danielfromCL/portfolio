# frozen_string_literal: true

require "Date"
require "BigDecimal"

# Class that represents a stock
class Stock
  attr_reader :id

  # Initializes a new stock with a given id
  # @param id [Integer] the stock's id
  def initialize(id)
    @id = id
  end

  # Returns the price of the stock at a given date
  # @param date [Date] the date to get the price for
  # @return [BigDecimal] the price of the stock at the given date
  def price(date)
    BigDecimal(date.to_time.to_i % (100 + @id)) # An id based number generator
  end
end
