class HomePageController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed
    end

  end

  def quiz
    @posts = current_user.liked_all
   
  end

  def search
    @users = User.all
    
    
  end

  def news
    @notices = Notification.where(user_id: current_user.id)

  end

  def direct_message
  end

  def post
    @post = current_user.posts.build if logged_in?
  end
end
