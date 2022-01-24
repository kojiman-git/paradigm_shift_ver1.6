Rails.application.routes.draw do
  get 'home_page/home'
  get 'home_page/quiz'
  get 'home_page/search'
  get 'home_page/news'
  get 'home_page/direct_message'
  get 'home_page/post'
   
  
  get 'static_pages/app_explanation'
  root 'static_pages#top'

end
