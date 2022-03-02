class HeadIconController < ApplicationController
  def profile
  end

  def follows_list
    

  end

  def followers_list
    

  end

  def app_detailed_description
  end

  def quiz_list
    @posts = current_user.liked_all
    
  end
end
    
