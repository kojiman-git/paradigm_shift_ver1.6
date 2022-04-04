Rails.application.routes.draw do
  
  
  get 'rooms/show'
  get 'sessions/new'
  get 'head_icon/profile'
  get 'head_icon/follows_list'
  get 'head_icon/followers_list'
  get 'head_icon/app_detailed_description'
  get 'head_icon/quiz_list'
  get 'search/post_search'
  get 'search/narrow_down_by_category'
  get 'search/user_search'
  get 'quiz_challenge/next_quiz'
  get 'quiz_challenge/previous_quiz'
  get 'quiz_challenge/check_the_answer'
  get 'home_page/home'
  get 'home_page/quiz'
  get 'home_page/search'
  get 'home_page/news'
  get 'home_page/direct_message'
  get 'home_page/post'
  root 'static_pages#top'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  get '/posts/:id',  to: 'posts#destroy'
  resources :posts,only: [:create,:destroy]
  resources :posts do
    get 'cre' => 'likes#create'
    get '/des' => 'likes#destroy'
  end

  resources :relationships,only: [:create, :destroy] 
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  get '/rooms',   to: 'rooms#create'
  resources :post_details ,only: [:create,:show] do
    resources :reviews, only: [:index, :create]
  end


end
   
  
