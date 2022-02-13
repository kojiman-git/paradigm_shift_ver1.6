class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
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
  
  private

    def user_params
      params.require(:user).permit(:name, :email,:intoroduction, :password,
                                   :password_confirmation)
    end

     # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
