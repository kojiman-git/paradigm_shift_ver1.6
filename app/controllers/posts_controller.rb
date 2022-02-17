class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to controller: :home_page, action: :home
    else
      render 'home_pages/post'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:paraphrase,:term)
    end
end