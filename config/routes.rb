Rails.application.routes.draw do



  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  
  resources :users, only: [:new, :create]
  post "users/confirm" => "users#confirm", :as => :confirm
  resources :sessions, only: [:new, :create, :destroy]


  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  root to: 'welcome#index'

end
