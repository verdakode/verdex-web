class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :reviewed, class_name: 'User'
  belongs_to :print_request
end
