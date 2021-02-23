class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
     validates :image,:name,:description,:category,:state,:postage,:region,:shipping_date
  end

  validates :price, presence: true, format: {with: VALID_PRICEL_HALF}, numercality: {only_integer: true, greater_than: 300, less_than: 9999999
  } 

  validates :category_id,:state_id,:postage_id,:region_id,:shipping_date_id numericality: { other_than: 1 }
end
