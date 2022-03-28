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

  private

    def category_params
      params.require(:post).permit(:m_category_id)
    end

  

end
