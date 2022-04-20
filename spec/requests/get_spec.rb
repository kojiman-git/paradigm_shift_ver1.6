require 'rails_helper'

RSpec.describe "get", type: :request do
  describe "[Action test]" do
    before do
      @user1 = FactoryBot.create(:user,:a)
      @user2 = FactoryBot.create(:user,:b)
      @user3 = FactoryBot.create(:user,:c)
      post login_path, 
      params: { session: { email: @user1.email,
        password: @user1.password } }
      @category = FactoryBot.create(:m_category, :a)
      @category = FactoryBot.create(:m_category, :b)
      @category = FactoryBot.create(:m_category, :c)
      @post1 = FactoryBot.create(:post,:a)
      @post2 = FactoryBot.create(:post,:b)
      @post3 = FactoryBot.create(:post,:c)
      @like = FactoryBot.create(:like,:a)
    end

    it "トップページにアクセスできること" do
      
      get '/'
      expect(response).to be_successful
    end
    it "ログインページにアクセスできること" do
      
      get '/login'
      expect(response).to be_successful
    end
    it "新規ユーザー登録ページにアクセスできること" do
      
      get '/users/new'
      expect(response).to be_successful
    end
    it "ホームページにアクセスできること" do
      
      get '/home_page/home'
      expect(response).to be_successful
    end
    it "クイズチャレンジにアクセスできること" do
     
      get '/home_page/quiz'
      expect(response).to be_successful
    end
    it "ユーザー一覧にアクセスできること" do
      get '/home_page/search'
      expect(response).to be_successful
    end
    it "お知らせ一覧にアクセスできること" do
      get '/home_page/news'
      expect(response).to be_successful
    end
    it "ダイレクトメッセージ相手一覧にアクセスできること" do
      get '/home_page/direct_message'
      expect(response).to be_successful
    end
    it "投稿編集ページにアクセスできること" do
      get '/home_page/post'
      expect(response).to be_successful
    end
    it "アプリ詳細ページにアクセスできること" do
      get '/head_icon/app_detailed_description'
      expect(response).to be_successful
    end
    it "クイズ一覧ページにアクセスできること" do
      get '/head_icon/quiz_list'
      expect(response).to be_successful
    end
    it "投稿一覧ページにアクセスできること" do
      get '/search/post_search'
      expect(response).to be_successful
    end
    it "カテゴリーで絞るボタンを押してページ遷移できること" do
      get '/search/narrow_down_by_category', 
      params: { post: { m_category_id: @category.id } }
      expect(response).to be_successful
    end
    it "ユーザー検索ボタンを押してページ遷移できること" do
      get '/search/user_search'
      expect(response).to be_successful
    end
    it "ユーザーのフォローリストページに遷移できること" do
      get "/users/#{@user1.id}/following"
      expect(response).to be_successful
    end
    it "ユーザーのフォロワーリストページに遷移できること" do
      get "/users/#{@user1.id}/followers"
      expect(response).to be_successful
    end
    it "投稿をお気に入りに追加できること" do
      get "/posts/#{@post1.id}/cre"
     
      expect(Like.count).to eq 2
    end
    it "投稿をお気に入り解除できること" do
      get "/posts/#{@post2.id}/des"
     
      expect(Like.count).to eq 0
    end
    it "投稿詳細画面へ遷移できること" do
      get "/post_details/#{@post1.id}"
     
      expect(response).to be_successful
    end
    it "投稿評価者一覧へ遷移できること" do
      get "/post_details/#{@post1.id}/reviews"
     
      expect(response).to be_successful
    end
    
   
   
    
   
    
  end
end