# frozen_string_literal: true

class InvoiceGenerator
  def initialize(client, amount)
    @client = client
    @amount = amount
  end

  def call
    Invoice.transaction do
      invoice = @client.invoices.create!(
        amount: @amount.amount,
        currency: @amount.currency,
        status: 'pending'
      )
      
      # Example logic for sending an invoice email
      # InvoiceMailer.with(invoice: invoice).send_invoice.deliver_later
      
      invoice
    end
  end
end