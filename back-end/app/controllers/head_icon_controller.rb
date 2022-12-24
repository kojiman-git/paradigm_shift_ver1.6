class HeadIconController < ApplicationController
  def profile
  end

  def follows_list
    

  end

  def followers_list
    

  end

  def app_detailed_description
  end

  def quiz_list
    @posts = current_user.liked_all
    quizList = []
    @posts.each do |post|
      quizList.push({post_id:post.id,user_id:post.user.id,user_name:post.user.name,term:post.term,paraphrase:post.paraphrase,category:post.m_category.name,created_at: post.created_at,avg_score:post.avg_score,reviewsCount:post.reviews.count,reviewScorePercentage:post.review_score_percentage,userImage:post.user.image.thumb.url,Liked:post.liked_by?(current_user),sameID:sameID?(post)})
    
    end
    render json: quizList
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
    
