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
    quizList = []
    @posts.each do |post|
      quizList.push({post_id:post.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,userImage:post.user.image.thumb.url})
    end
    render json: quizList
   
  end

  def quiz_filter

    if params.require(:post).require(:m_category_id).to_i == 7
      @posts = current_user.liked_all
    else
      @posts = current_user.liked_all.select{|post| post.m_category_id == params.require(:post).require(:m_category_id).to_i}
    end

    quizList = []

    @posts.each do |post|
      quizList.push({post_id:post.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,userImage:post.user.image.thumb.url})
    end

    render json: quizList
 
  end

  
  def search
    @users = User.all

    usersList = []

    @users.each do |user|
      usersList.push({userID:user.id,userName: user.name,intoroduction: user.intoroduction,image:user.image.thumb.url,currentUser:current_user?(user),followingJudgment:current_user.following?(user)})
    end

    render json: usersList
    
  end


  def news
    @notices = Notification.where(user_id: current_user.id).order(created_at: :desc)

    noticeList = []

    @notices.each do |notice|
      
      if !notice.subjectuser.nil?
        noticeList.push({id:notice.id,subjectuserID:notice.subjectuser.id,subjectuserImage:notice.subjectuser.image.thumb.url,content:notice.content,created_at: notice.created_at.in_time_zone('Tokyo')})
      end 

    end

    render json: noticeList

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
        @message_partners.push({id:g.id,userID:g.user_id,userName: g.user.name,userImage:g.user.image.thumb.url,roomId:g.room_id})
        end
      end
    end
    
    render json: @message_partners
    
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

   
        
          
      
    
