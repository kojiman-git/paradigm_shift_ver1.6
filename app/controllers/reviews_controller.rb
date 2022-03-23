class ReviewsController < ApplicationController
  def index
    @post = Post.find(params[:post_detail_id])
    @reviews = @post.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to post_detail_path(@review.post_id)
    else
      @post = Post.find(params[:id])
      @comment= Comment.new
      @comments = Comment.where(post_id: @post.id)
      render "post_details/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:post_id, :score)
  end
end
