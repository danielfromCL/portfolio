# frozen_string_literal: true

require "spec_helper"
require "Date"

RSpec.describe Portfolio do
  it "creates a new Portfolio" do
    expect(Portfolio.new).to be_a Portfolio
    empty_portfolio = Portfolio.new
    expect(empty_portfolio.stocks).to eq []
    stock_1 = Stock.new(1)
    stock_2 = Stock.new(2)
    new_portfolio = Portfolio.new([stock_1, stock_2])
    expect(new_portfolio.stocks).to eq [stock_1, stock_2]
  end

  it "calculates profit correctly for portfolio with multiple stocks" do
    stock_1 = Stock.new(1)
    stock_2 = Stock.new(2)
    stock_3 = Stock.new(3)
    date_1 = Date.new(2021, 1, 1)
    date_2 = Date.new(2021, 1, 2)
    s1_price_1 = stock_1.price(date_1)
    s2_price_1 = stock_2.price(date_1)
    s3_price_1 = stock_3.price(date_1)
    s1_price_2 = stock_1.price(date_2)
    s2_price_2 = stock_2.price(date_2)
    s3_price_2 = stock_3.price(date_2)
    portfolio = Portfolio.new([stock_1, stock_2, stock_3])
    expect(portfolio.profit(date_1,
                            date_2)).to eq((s1_price_2 - s1_price_1) + (s2_price_2 - s2_price_1) + (s3_price_2 - s3_price_1))
  end

  it "calculates profit correctly for empty portfolio" do
    date_1 = Date.new(2021, 1, 1)
    date_2 = Date.new(2021, 1, 2)
    portfolio = Portfolio.new([])
    expect(portfolio.profit(date_1, date_2)).to eq 0
  end
end
