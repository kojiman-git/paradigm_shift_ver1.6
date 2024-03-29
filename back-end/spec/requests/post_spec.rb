require 'rails_helper'

RSpec.describe "post", type: :request do
  describe "[Action test]" do

    before do
      @user1 = FactoryBot.create(:user,:a)
      @user2 = FactoryBot.create(:user,:b)
      @user3 = FactoryBot.create(:user,:c)
      post login_path, 
      params: { session: { email: @user1.email,
        password: @user1.password } }
      @category1 = FactoryBot.create(:m_category, :a)
      @category2 = FactoryBot.create(:m_category, :b)
      @category3 = FactoryBot.create(:m_category, :c)
      @post1 = FactoryBot.create(:post,:a)
      @post2 = FactoryBot.create(:post,:b)
      @post3 = FactoryBot.create(:post,:c)
      @like = FactoryBot.create(:like,:a)
      @room = FactoryBot.create(:room,:a)
      @entry1 = FactoryBot.create(:entry,:a)
      @entry2 = FactoryBot.create(:entry,:b)
      @relationship = FactoryBot.create(:relationship,:a)
    end

    it "新規ユーザー登録できること" do
      post   "/users",
      params: { name: "テスト",email: "test@gmail.com",
        password: "testpassword", password_confirmation: "testpassword" } 
        expect(User.count).to eq 4
    end

    it "投稿できること" do
      post   "/posts",
      params: { post: { term: "テスト",paraphrase: "テスト",
        m_category_id: "2"} }
      expect(Post.count).to eq 4
    end

    it "ユーザーをフォローできること" do
      post   "/relationships",
      params: { id: @user3.id }
      expect(Relationship.count).to eq 2
    end

    it "DMでメッセージを送信できること" do
      post   "/messages",
      params: { message: {user_id:current_user.id, room_id: @room.id,message: "テスト"} }
      expect(Message.count).to eq 1
    end

    it "まだDMしてないユーザーのメッセージボタンを押すと専用のトークルームができること" do
      post   "/rooms",
      params: { entry: {user_id:@user3.id} }
      expect(Room.count).to eq 2
    end

    it "投稿に評価点をつけることができること" do
      post   "/post_details/#{@post2.id}/reviews",
      params: { review: {post_id:@post2.id,score: 4} }
      expect(Review.count).to eq 1
    end

    it "投稿にコメントができること" do
      post   "/post_details",
      params: { comment: {comment:"テストコメント",post_id: @post2.id} }
      expect(Comment.count).to eq 1
    end

  end
end