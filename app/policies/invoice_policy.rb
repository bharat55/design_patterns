# frozen_string_literal: true

class InvoicePolicy
  attr_reader :user, :invoice

  def initialize(user, invoice)
    @user = user
    @invoice = invoice
  end

  def destroy?
    invoice.status == 'pending' && user.admin?
  end
end