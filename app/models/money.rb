# frozen_string_literal: true

class Money
  attr_reader :amount, :currency

  def initialize(amount, currency = 'USD')
    @amount = amount.to_f
    @currency = currency
  end

  def format
    "#{currency} #{'%.2f' % amount}"
  end

  def +(other)
    Money.new(amount + other.amount, currency)
  end
end