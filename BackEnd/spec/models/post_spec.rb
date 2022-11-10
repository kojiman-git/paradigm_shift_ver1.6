require 'rails_helper'

RSpec.describe Post, type: :model do

it "すべてのカラムが入力されていれば有効であること" do
  post = Post.new(
      user_id: "5",
      term: "テスト",
      paraphrase:   "テスト",
      m_category_id: "19",
  )
  expect(post).to be_valid
end
 
 it "用語がなければ無効になること" do
  post = Post.new(term: nil)
  post.valid?
  expect(post.errors[:term]).to include("can't be blank")
end
 it "言い換えがなければ無効になること" do
  post = Post.new(paraphrase: nil)
  post.valid?
  expect(post.errors[:paraphrase]).to include("can't be blank")
end
 it "カテゴリーがなければ無効になること" do
  post = Post.new(m_category_id: nil)
  post.valid?
  expect(post.errors[:m_category_id]).to include("can't be blank")
end
 it "言い換えが250文字より多ければ無効になること" do
  post = Post.new(paraphrase: "a"*251)
  post.valid?
  expect(post.errors[:paraphrase]).to include("is too long (maximum is 250 characters)")
end
 it "言い換えが250文字以下であれば有効になること" do
  post = Post.new(paraphrase: "a"*250)
  post.valid?
  expect(post.errors[:paraphrase]).not_to include("is too long (maximum is 250 characters)")
end

end
