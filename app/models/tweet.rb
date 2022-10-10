class Tweet < ApplicationRecord
  belongs_to :user,optional: true
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :user_id
  end
end
