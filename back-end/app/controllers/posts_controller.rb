class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(params.require(:post).permit(:paraphrase,:term,:m_category_id))
    
    if @post.save
      payload = { message: '投稿完了です'}
    else
      payload = { message: '投稿失敗です' }
    end
    render json: payload
  end

  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      payload = { message: '削除完了です'}
    else
      payload = { message: '削除失敗です' }
    end
    render json: payload
   
  end

  def getDefaultRankingData
    
    posts = Post.where(m_category_id:1)
    avgPostsList = posts.sort_by { |post| -(post.avg_score) }
     
    postList = []

    avgPostsList.each_with_index do |post,i|
      postList.push({Rank:i+1,post_id:post.id,user_id:post.user.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,avg_score:post.avg_score,reviewsCount:post.reviews.count,userImage:post.user.image.thumb.url}) 
    end
     
    render json: postList

  end
 # params.require(:subjectId)
  def getRankingData
    
    posts = Post.where(m_category_id: params.require(:subjectId))

    avgPostsList = posts.sort_by { |post| -(post.avg_score) }
    
    postList = []

    avgPostsList.each_with_index do |post,i|
      postList.push({Rank:i+1,post_id:post.id,user_id:post.user.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,avg_score:post.avg_score,reviewsCount:post.reviews.count,userImage:post.user.image.thumb.url}) 
    end
     
    render json: postList

  end

  private

    def post_params
      params.require(:post).permit(:paraphrase,:term,:m_category_id)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      
      redirect_to controller: :home_page, action: :home if @post.nil?
    end
end