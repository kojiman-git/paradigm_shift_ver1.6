class Post < ApplicationRecord
  
  has_many :likes , dependent: :destroy
  has_many :users, through: :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :paraphrase, presence: true, length: { maximum: 250 }
end
