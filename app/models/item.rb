class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date

  with_options presence: true do
     validates :image,:name,:description,:category_id,:state_id,:postage_id,:region_id,:shipping_date_id,:price
  end

  validates :price, numericality: {with: /\A[0-9]+\z/ ,only_integer: true ,greater_than: 300, less_than: 9999999} 

  validates :category_id,:state_id,:postage_id,:region_id,:shipping_date_id, numericality: { other_than: 1 }
end
