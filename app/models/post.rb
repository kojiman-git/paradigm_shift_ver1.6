class Post < ApplicationRecord
  has_many :reviews , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :likes , dependent: :destroy
  has_many :users, through: :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
  
  belongs_to :m_category, optional: true
  belongs_to :user, optional: true
  default_scope -> { order(created_at: :desc) }
  validates :term, presence: true
  validates :user_id, presence: true
  validates :m_category_id, presence: true
  validates :paraphrase, presence: true, length: { maximum: 250 }
end
