class StaticPagesController < ApplicationController
  def top
  end

  def guest_sign_in
    user = User.find_by(email: 'guest@gmail.com')
    log_in(user)
    redirect_to "/home_page/home"
  end
end
