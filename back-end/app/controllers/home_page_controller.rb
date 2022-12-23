class HomePageController < ApplicationController
  def home
    if logged_in?
      @posts = current_user.feed
      vueHome = []
      @posts.each do |post|
        vueHome.push({post_id:post.id,user_id:post.user.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,created_at: post.created_at,avg_score:post.avg_score,reviewsCount:post.reviews.count,reviewScorePercentage:post.review_score_percentage,userImage:post.user.image.thumb.url,Liked:post.liked_by?(current_user),sameID:sameID?(post)})
      
      end
      render json: vueHome

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


  private
  def sameID?(post)
    if post.user.id == current_user.id
      true
    else
      false
    end
  end
end

   
        
          
      
    
