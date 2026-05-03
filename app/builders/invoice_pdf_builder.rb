# frozen_string_literal: true

class InvoicePdfBuilder
  def initialize(invoice)
    @invoice = invoice
    @document = {}
  end

  def add_header
    @document[:header] = "Invoice ##{@invoice.id}"
    self
  end

  def add_body
    @document[:body] = "Billed to: #{@invoice.client_id} | Amount: #{@invoice.amount}"
    self
  end

  def build
    @document
  end
end