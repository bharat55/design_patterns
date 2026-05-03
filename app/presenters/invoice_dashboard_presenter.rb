# frozen_string_literal: true

class InvoiceDashboardPresenter
  def initialize(client)
    @client = client
  end

  def total_billed
    sum = @client.invoices.where(status: 'paid').sum(:amount)
    Money.new(sum).format
  end

  def outstanding_balance
    sum = @client.invoices.where(status: 'pending').sum(:amount)
    Money.new(sum).format
  end
end