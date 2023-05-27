class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update,:following, :followers]
  
  def index
    
  end

  def show

    @user = User.find(params[:id])
   
    @posts = @user.posts 

    userPosts = []

    @posts.each do |post|
      userPosts.push({post_id:post.id,user_id:post.user.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,created_at: post.created_at,avg_score:post.avg_score,reviewsCount:post.reviews.count,userImage:post.user.image.thumb.url,Liked:post.liked_by?(current_user),sameID:sameID?(post)})
    
    end

    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
            
          end
        end
        
      end
      if @isRoom
      else
        @isRoom = false
        @roomId = nil
      end
    end

    vueProfile = {userID:@user.id,userName: @user.name,userEmail: @user.email,intoroduction: @user.intoroduction,image:@user.image.thumb.url,currentUser:current_user?(@user),following:@user.following.count,follower:@user.followers.count,followingJudgment:current_user.following?(@user),userPosts:userPosts,IsRoom:@isRoom,RoomId:@roomId}

    render json: vueProfile

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:name],email: params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
  
    if @user.save
      log_in @user
      payload = { message: 'ユーザーを作ってログインしました。',id: @user.id, name: @user.name ,email: @user.email,intoroduction: @user.intoroduction,profile_url: @user.profile_url,image: @user.image.thumb.url}
    else
      payload = { message: 'ユーザーの保存に失敗しました。' }
    end
    render json: payload
  end

    

  def edit
    @user = User.find(params[:id])
    userInfo = {name:@user.name,email:@user.email,intoroduction:@user.intoroduction,
      image:@user.image}
    render json: userInfo
  end

  
  def update
    @user = User.find(params[:id])
    if @user.update(  params.require(:user).permit(:name, :email,:intoroduction, :password,:password_confirmation,:image))
      
      payload = { message: 'ユーザーを更新しました'}
    else
      payload = { message: 'ユーザーを更新に失敗しました'}
    end
    render json: payload
  end

  def destroy
  end

  def following
    
    @user  = User.find(params[:id])
    @users = @user.following
    
    render json: @users
  end

  def followers
    
    @user  = User.find(params[:id])
    @users = @user.followers

    followersList = []
      @users.each do |user|
        followersList.push({user_id:user.id,user_name:user.name,userImage:user.image.thumb.url,intoroduction:user.intoroduction,follow:current_user.following?(user)})
      end
    render json:  followersList
  end

  def currentUser
    
    user  = current_user
    payload = {id: user.id, name: user.name ,email: user.email,intoroduction: user.intoroduction,profile_url: user.profile_url,image: user.image.thumb.url}
    render json: payload

  end

  
  private

    def user_params
      params.require(:user).permit(:name, :email,:intoroduction, :password,
                                   :password_confirmation,:image)
    end

    def sameID?(post)
      if post.user.id == current_user.id
        true
      else
        false
      end
    end

end
