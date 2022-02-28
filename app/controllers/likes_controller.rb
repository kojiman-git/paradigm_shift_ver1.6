class LikesController < ApplicationController
  
  def create
    user = current_user
    post = Post.find(params[:post_id])
    like = Like.create(user_id: user.id, post_id: post.id)
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
  
 
