# frozen_string_literal: true

module Notifiable
  extend ActiveSupport::Concern

  included do
    after_create :notify_creation
  end

  private

  def notify_creation
    Rails.logger.info("Notification sent for new #{self.class.name}!")
  end
end