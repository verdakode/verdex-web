class PrintRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  has_many :print_offers
  has_one :review
end
