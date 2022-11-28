class PictorialBook < ApplicationRecord
belongs_to :user
has_one_attached :image

with_options presence: true do
  validates :plant_name
  validates :type
  validates :image
  validates :difficulty
  validates :cultivation
  validates :data
end
end
