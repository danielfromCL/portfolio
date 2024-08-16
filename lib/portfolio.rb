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
  # @return [Hash] a hash containing the net profit for the given range, and the annualized return between said dates
  def profit(from_date, to_date)
    profit = BigDecimal(0)
    initial_value = BigDecimal(0)
    end_value = BigDecimal(0)
    @stocks.each do |stock|
      # the profit of each stock between two dates is the difference between the price at the end date and the price at the start date
      profit += stock.price(to_date) - stock.price(from_date)
      initial_value += stock.price(from_date)
      end_value += stock.price(to_date)
    end
    # Convert difference between dates into year format
    year_percentage = (to_date - from_date) / BigDecimal(365)
    # Only calculate return if starting price was not 0 or some time has passed, since division by 0 is not allowed
    annualized_return = if year_percentage.zero? || initial_value.zero?
                          0
                        else
                          (end_value / initial_value - 1) / year_percentage
                        end

    { net_profit: profit, annualized_return: }
  end
end
