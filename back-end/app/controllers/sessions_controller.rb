class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      payload = { message: 'ログインしました。', name: user.name }
    else
      payload = { message: 'メールアドレスまたはパスワードが正しくありません。' }
    end
    render json: payload
  end

  def destroy
    log_out
    redirect_to root_url
  end
end