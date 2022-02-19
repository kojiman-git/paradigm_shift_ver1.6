class HomePageController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed
    end

  end

  def quiz
  end

  def search
    @users = User.all
  end

  def news
  end

  def direct_message
  end

  def post
    @post = current_user.posts.build if logged_in?
  end
end
