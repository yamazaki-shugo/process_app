class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :organization  
  has_many :room_users
  has_many :rooms, through: :room_users 
  has_many :notices    
  
  validates :nickname, :age, presence: true
end
