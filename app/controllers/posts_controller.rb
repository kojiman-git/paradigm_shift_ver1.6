class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to home_page_home_path
    else
      @feed_items = []
      render 'home_page/post'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to request.referrer || root_url
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