class LikesController < ApplicationController
  
  def create
    user = current_user
    post = Post.find(params[:post_id])
    like = Like.create(user_id: user.id, post_id: post.id)
    liked_user = User.find_by(id:post.user_id)
    notice = Notification.create(user_id: liked_user.id, content:"#{user.name}さんが#{post.term}の投稿をお気に入りに追加しました。")
    
    redirect_to request.referrer

  end

  def destroy
    user = current_user
    post = Post.find(params[:post_id])
    like = Like.find_by(user_id: user.id, post_id: post.id)
    like.delete
    redirect_to request.referrer
  end

end
  
 
