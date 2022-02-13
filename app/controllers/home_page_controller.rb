class HomePageController < ApplicationController
  def home
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
  end
end
