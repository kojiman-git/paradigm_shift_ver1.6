class MCategory < ApplicationRecord
  has_many :posts, dependent: :destroy
  
end
