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

  private

    def post_params
      params.require(:post).permit(:paraphrase,:term,:m_category_id)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      
      redirect_to controller: :home_page, action: :home if @post.nil?
    end
end