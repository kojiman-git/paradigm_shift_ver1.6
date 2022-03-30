class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update,:following, :followers]
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the paradigm shift!"
      redirect_to controller: :home_page, action: :home
    else
      
      render 'new'
      
    end
  
      
  end

    

  def edit
    @user = User.find(params[:id])
  end

  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to controller: :head_icon, action: :profile
    else
      
      render 'edit'
    end
  end

  def destroy
  end

  def following
    
    @user  = User.find(params[:id])
    @users = @user.following
    
    # render 'head_icon/follows_list'
  end

  def followers
    
    @user  = User.find(params[:id])
    @users = @user.followers
    # render 'head_icon/followers_list'
    
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email,:intoroduction, :password,
                                   :password_confirmation,:image)
    end

    

end
