class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true
end
