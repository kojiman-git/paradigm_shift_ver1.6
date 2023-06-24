class Notification < ApplicationRecord
  belongs_to :subjectuser, class_name: "User"
  belongs_to :user, class_name: "User"
  validates :user_id, presence: true
end
