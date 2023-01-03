class SearchController < ApplicationController
  def post_search
    @posts = Post.all
    @post = Post.new
  end
  
  def narrow_down_by_category
    @posts = Post.where(category_params)
    
    if @posts[0].nil?
      @posts = Post.all
    end
    @post = Post.new
  end

  def user_search
    
    @users = User.search(params[:keyword])
   
    usersList = []

    @users.each do |user|
      usersList.push({userID:user.id,userName: user.name,intoroduction: user.intoroduction,image:user.image.thumb.url,currentUser:current_user?(user),followingJudgment:current_user.following?(user)})
    end

    render json: usersList
  end

  private

    def category_params
      params.require(:post).permit(:m_category_id)
    end

  

end
