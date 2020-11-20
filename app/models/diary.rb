class Diary < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :date, uniqueness: true
    validates :objective
    validates :practice_menu
    validates :discovery
    validates :reflection
    validates :task
    validates :mvp
    validates :image
  end
end
