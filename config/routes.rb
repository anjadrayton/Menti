Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :mentorships do
    resources :mentorship_applications, only: [:new, :create]
  end

  resources :mentorship_applications, only: [:edit, :show, :update]

  get 'dashboard', to: 'dashboard#dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
