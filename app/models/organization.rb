class Organization < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :occupation

  with_options presence: true do
    validates :name
    validates :phone_number, format: { with: /\A\d{10,11}\z/ } # ハイフンなし10or11桁
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ } # ハイフンあり7桁
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :occupation_id, numericality: { other_than: 1 }
  end
end
