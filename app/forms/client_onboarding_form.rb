# frozen_string_literal: true

class ClientOnboardingForm
  include ActiveModel::Model

  attr_accessor :name, :email, :company_name, :hourly_rate

  validates :name, :email, :hourly_rate, presence: true

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      @client = Client.create!(name: name, email: email, company_name: company_name)
      @client.rates.create!(amount: hourly_rate)
    end
    true
  rescue StandardError
    false
  end
end