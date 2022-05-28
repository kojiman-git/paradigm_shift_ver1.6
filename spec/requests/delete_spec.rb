require 'rails_helper'

RSpec.describe "delete", type: :request do
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

    it "投稿を削除できること" do
      delete "/posts/#{@post1.id}"
      expect(Post.count).to eq 2
    end

    it "フォローを解除できること" do
      delete "/relationships/1"
      expect(Relationship.count).to eq 0
    end

   

    
  end
end