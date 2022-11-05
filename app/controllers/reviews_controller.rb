class ReviewsController < ApplicationController
  def index
    @post = Post.find(params[:post_detail_id])
    @reviews = @post.reviews

    # 既存: HTMLをRailsを返している
    # URLごとに /posts /reviewsなどURLごとにページを返してあげて、ブラウザを画面を更新している
    # ↓
    # SPA
    # URLが変わっても、画面の読み込みが起きない
    # 最初にフロント部分を全部読み込んで、バックエンドにリクエストを送って、表示したい情報を取得して、それをVueに表示されている
    # URLが変わっても(/reviews /posts)画面の再読み込みにはならなく、更新が必要な部分を更新してあげている
    # HTMLを返す必要がなくなる
    # HTMLではなくjsonデータをRailsが返すようにしましょう。
    # jsonの中身によって表示したい項目などをハンドリングします
    # {
    #    status: 200,
    #    data: {}
    #  }
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      
      redirect_to post_detail_path(@review.post_id)

    else
      @post = Post.find(params[:post_detail_id])
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
