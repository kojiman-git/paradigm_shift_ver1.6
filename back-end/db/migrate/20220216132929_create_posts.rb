class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :term
      t.text :paraphrase
      t.integer :m_category_id

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
