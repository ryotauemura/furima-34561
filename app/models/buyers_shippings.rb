class BuyersShipping
  include ActiveModel::Model
  attr_accessor :postal_code,:prefectures,:municipality,:address,:phone_number,:user_id,:item_id
end