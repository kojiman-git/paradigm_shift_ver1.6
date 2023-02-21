class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      payload = { message: 'ログインしました。',id: user.id, name: user.name ,email: user.email,intoroduction: user.intoroduction,profile_url: user.profile_url,image: user.image.thumb.url}
    else
      payload = { message: 'メールアドレスまたはパスワードが正しくありません。' }
    end
    
    render json: payload
  end

  def destroy
    log_out
    payload = { message: 'ログアウトしました'}
    render json: payload
  end
end