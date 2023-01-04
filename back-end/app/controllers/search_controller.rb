class SearchController < ApplicationController
  def post_search
    @posts = Post.all

    postList = []

    @posts.each do |post|
      postList.push({post_id:post.id,user_id:post.user.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,created_at: post.created_at,avg_score:post.avg_score,reviewsCount:post.reviews.count,userImage:post.user.image.thumb.url,Liked:post.liked_by?(current_user),sameID:sameID?(post)})
    end

    render json: postList
  end
  
  def narrow_down_by_category
    @posts = Post.where(params.require(:post).permit(:m_category_id))
  
    if params[:post][:m_category_id] == "7"
      @posts = Post.all
    end

    postList = []

    @posts.each do |post|
      postList.push({post_id:post.id,user_id:post.user.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,created_at: post.created_at,avg_score:post.avg_score,reviewsCount:post.reviews.count,userImage:post.user.image.thumb.url,Liked:post.liked_by?(current_user),sameID:sameID?(post)})
    end

    render json: postList
    
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

    def sameID?(post)
      if post.user.id == current_user.id
        true
      else
        false
      end
    end

end
