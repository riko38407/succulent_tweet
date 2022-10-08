class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :text
  validates :image
  validates :user_id
  end
end
