class Event < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :title, presence: true
  validates :content, presence: true
end
