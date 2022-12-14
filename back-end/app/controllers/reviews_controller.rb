class ReviewsController < ApplicationController
  def index
    @post = Post.find(params[:post_detail_id])
    @reviews = @post.reviews
  end

  def create
    @review = Review.new(params.require(:review).permit(:post_id, :score))
    @review.user_id = current_user.id
    if @review.save
      payload = { message: "レビューを生成しました"}
    else
      payload = { message: "レビューを生成に失敗しました"}
    end
    render json: payload
  end

  private
  def review_params
    params.require(:review).permit(:post_id, :score)
  end
end
