class BuyersShippings
  include ActiveModel::Model
  attr_accessor :postal_code,:region_id,:municipality,:address,:building,:phone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :municipality,:address,:user_id,:token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
  end

  validates :region_id,numericality: {other_than: 1, message: "can't be blank"}

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, region_id: region_id, municipality: municipality, address: address, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end