# frozen_string_literal: true

class UnpaidInvoiceQuery
  def initialize(relation = Invoice.all)
    @relation = relation
  end

  def call
    @relation.where(status: 'pending').order(created_at: :desc)
  end
end