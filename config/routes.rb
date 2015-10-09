Rails.application.routes.draw do



  resources :labels
  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  resources :users, only: [:new, :create, :show]
  post "users/confirm" => "users#confirm", :as => :confirm
  resources :sessions, only: [:new, :create, :destroy]


  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  root to: 'welcome#index'

end
