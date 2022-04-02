class HomePageController < ApplicationController
  def home
    if logged_in?
      @posts = current_user.feed
    end

  end

  def quiz
    @posts = current_user.liked_all
   
  end

  def search
    @users = User.all
    
    
  end

  def news
    @notices = Notification.where(user_id: current_user.id).order(created_at: :desc)

  end

  def direct_message
    
    @current_user_room = Entry.where(user_id: current_user.id)
    @room_id = @current_user_room.map do |c|
        c.room_id
    end
    @message_partners = []
    @room_id.each do |room_id|
      Entry.where(room_id: room_id).each do |g|
        unless current_user.id == g.user_id
        @message_partners.push(g)
        end
      end
    end
    
    
    
  end

  def post
    @post = current_user.posts.build if logged_in?
  end
end

   
        
          
      
    
