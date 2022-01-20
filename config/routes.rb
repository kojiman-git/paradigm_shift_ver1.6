Rails.application.routes.draw do
  get 'static_pages/top'
  get 'static_pages/home'
  get 'static_pages/app_explanation'
  root 'application#hello'
end
