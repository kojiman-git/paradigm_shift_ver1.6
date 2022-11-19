class StaticPagesController < ApplicationController
  def top
    render json: User.all 
  end

  def guest_sign_in
    user = User.find_by(email: 'guest@gmail.com')
    log_in(user)
    redirect_to "/home_page/home"
  end
end
