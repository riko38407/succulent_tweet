class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :relationships, foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :following


  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    validates :name
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
    validates :email
  end
  end
