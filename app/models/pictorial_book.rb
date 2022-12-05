class PictorialBook < ApplicationRecord
belongs_to :user
has_one_attached :image
belongs_to :type
belongs_to :difficulty



with_options presence: true do
  validates :plant_name
  validates :image
  validates :type
  validates :difficulty
  validates :cultivation
  validates :data
end
validates :tyoe_id, numericality: { other_than: 1, message: "can't be blank"} 
validates :difficulty_id, numericality: { other_than: 1, message: "can't be blank"} 
end
