class PostDetailsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment= Comment.new
    @comments = Comment.where(post_id: @post.id)
    
  end

  def create
    
      @comment = Comment.create(params.require(:comment).permit(:user_id, :comment, :post_id).merge(user_id: current_user.id))
     
    
     redirect_to "/post_details/#{@comment.post_id}"
  end


end
