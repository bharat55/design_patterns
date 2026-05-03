class Invoice < ApplicationRecord
  
  belongs_to :client

  include Notifiable
end
