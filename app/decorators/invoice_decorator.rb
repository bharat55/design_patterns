# frozen_string_literal: true

class InvoiceDecorator < Draper::Decorator
  delegate_all

  def formatted_amount
    Money.new(object.amount, object.currency).format
  end

  def status_tag
    color = object.status == 'paid' ? 'green' : 'orange'
    h.content_tag(:span, object.status.capitalize, class: "badge #{color}")
  end
end