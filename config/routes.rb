Rails.application.routes.draw do
  get 'head_icon/profile'
  get 'head_icon/follows_list'
  get 'head_icon/followers_list'
  get 'head_icon/app_detailed_description'
  get 'head_icon/quiz_list'
  get 'search/post_search'
  get 'quiz_challenge/next_quiz'
  get 'quiz_challenge/previous_quiz'
  get 'quiz_challenge/check_the_answer'
  get 'home_page/home'
  get 'home_page/quiz'
  get 'home_page/search'
  get 'home_page/news'
  get 'home_page/direct_message'
  get 'home_page/post'
   
  
  get 'static_pages/app_explanation'
  root 'static_pages#top'

end
