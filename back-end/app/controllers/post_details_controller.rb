class PostDetailsController < ApplicationController
  def show

    @post = Post.find(params[:id])
    @review = Review.where(user_id:current_user.id,post_id:@post.id)
    @comments = Comment.where(post_id: @post.id)
    if @review[0]
      @reviewed = true
    else
      @reviewed = false
    end

    postDetailsComments = [] 

    @comments.each do |comment|
      postDetailsComments.push({id: comment.id,user_name:comment.user.name,created_at: comment.created_at,userImage:comment.user.image.thumb.url,comment:comment.comment})
    end

    postDetailsInfo = {post_id:@post.id,user_id:@post.user.id,user_name:@post.user.name,term:@post.term,paraphrase:@post.paraphrase,category:@post.m_category.name,created_at: @post.created_at,reviewsCount:@post.reviews.count,userImage:@post.user.image.thumb.url,Liked:@post.liked_by?(current_user),comments:postDetailsComments,reviewed:@reviewed}
    
    render json: postDetailsInfo
  end

  def create
    @comment = Comment.create(params.require(:comment).permit(:user_id, :comment, :post_id).merge(user_id: current_user.id))
    
    payload = { message: 'コメント生成しました', comment:@comment.comment}
   
    render json: payload
  end
  


end
