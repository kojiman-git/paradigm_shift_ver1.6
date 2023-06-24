class LikesController < ApplicationController
  
  def create
    user = current_user
    post = Post.find(params[:post_id])
    like = Like.create(user_id: user.id, post_id: post.id)
    liked_user = User.find_by(id:post.user_id)
    if liked_user != user
      Notification.create(subjectuser_id: user.id,user_id: liked_user.id, content:"#{user.name}さんが#{post.term}の投稿をお気に入りに追加しました。")
    end
    
    if like 
      payload = { message: 'お気に入り登録できました' }
    else
      payload = { message: 'お気に入り登録できませんでした' }
    end
    
    render json: payload

  end

  def destroy
    user = current_user
    post = Post.find(params[:post_id])
    like = Like.find_by(user_id: user.id, post_id: post.id)
    if like.delete
      payload = { message: 'お気に入り解除できました' }
    else
      payload = { message: 'お気に入り解除できませんでした' }
    end
    
    render json: payload
  end

end
  
 
