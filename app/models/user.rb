class User < ApplicationRecord
  has_secure_password
  has_many :print_requests, foreign_key: :requester_id
  has_many :print_offers, foreign_key: :printer_id
  has_many :reviews_as_reviewer, class_name: 'Review', foreign_key: :reviewer_id
  has_many :reviews_as_reviewed, class_name: 'Review', foreign_key: :reviewed_id
end
