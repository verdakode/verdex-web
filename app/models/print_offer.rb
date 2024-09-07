class PrintOffer < ApplicationRecord
  belongs_to :print_request
  belongs_to :printer, class_name: 'User'
end
