class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    followed_notice = Notification.create(user_id: user.id, content:"#{current_user.name}さんがあなたをフォローしました。")
    redirect_to user
  end
    

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    payload = { message: "フォロー解除しました"}
    render json: payload
  end
end
