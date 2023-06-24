class AddSubjectuserIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :subjectuser, foreign_key: {to_table: :users} 
  end
end
