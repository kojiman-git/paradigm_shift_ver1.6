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
    # 課題1: jsonの形をどうしたらいいか？書く人にバラバラになったり、APIごとにformatが異なって、フロントでの取り回しが難しい
    # 解決法: 何かしらのjsonのformatに則りましょう.
    # 例: https://jsonapi.org/
    @json = {
      "data": [{
        "type": "reviews",
        "id": "1",
        "attributes": {
          "score": 100
        },
        "relationships": {
          "author": {
            "data": { "type": "post", "id": "1" }
          },
        },
      }],
      "included": [{
        "type": "post",
        "id": "1",
        "attributes": {
          "paraphrase": "Dan",
          "term": "Gebhardt"
        },
      }]
    }

    # 課題2: 上記のようなjsonを毎回作るのめんどくさい、いい感じに整形してくれるのがないかな？
    # https://github.com/jsonapi-serializer/jsonapi-serializer
    # jsonapi-serializerを使えば、json apini準拠したformatでdataをシリアライズしてくれる
    # rails g serializerを使いたいモデルクラス
    # シリアライザには、フロントに返してあげたい情報を設定する(必要なカラムを記述上げる)
    # シリアライザで、どういうデータを返すかを定義する場所
    render json: ReviewSerializer.new(@reviews).serializable_hash
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
