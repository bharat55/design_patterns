# frozen_string_literal: true

class ChargeClient
  include Interactor

  def call
    client = context.client
    amount = context.amount

    # Execute and handle the charging API
    payment_result = PaymentGateway.charge(amount: amount, customer_id: client.stripe_id)

    if payment_result.success?
      context.invoice.update!(status: 'paid')
    else
      context.fail!(message: "Payment failed: #{payment_result.error}")
    end
  end
end