class Buyer < ApplicationRecord
  belongs_to :user
  has_one :shipping
end
