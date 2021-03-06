class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    followed_notice = Notification.create(user_id: user.id, content:"#{current_user.name}さんがあなたをフォローしました。")
    redirect_to user
  end
    

  def destroy
    user = Relationship.find(params[:id]).followed
    
    current_user.unfollow(user)
    redirect_to user
  end
end
