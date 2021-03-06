class Room < ApplicationRecord
  has_secure_password

  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :diaries, dependent: :destroy

  with_options presence: true do
    validates :name, uniqueness: true #重複禁止
    validates :password, format: { with: /\A[a-z\d]{8,100}+\z/i }
  end
end
