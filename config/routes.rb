Rails.application.routes.draw do
   
  get 'application/application'
  get 'static_pages/app_explanation'
  root 'static_pages#top'

end
