class SessionsController < ApplicationController

  def new
  end

  # SPAのログインに関してはgemを使えば問題ない
  # 参考: https://qiita.com/tomokazu0112/items/5fdd6a51a84c520c45b5
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "You were able to log in"
      redirect_to controller: :home_page, action: :home
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end