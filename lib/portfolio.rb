# frozen_string_literal: true
# Class that represents a portfolio of stocks
class Portfolio
  attr_accessor :stocks

  def initialize(stocks = [])
    @stocks = stocks
  end

  # Calculates the portfolio's profit for a given date range
  # @param from_date [Date] the start date
  # @param to_date [Date] the end date
  # @return [BigDecimal] the profit
  def profit(from_date, to_date)
    profit = BigDecimal(0)
    @stocks.each do |stock|
      profit += stock.price(to_date) - stock.price(from_date)
    end
    profit
  end
end
