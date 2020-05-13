Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  devise_scope :user do
  	get 'login', to: 'devise/sessions#new', as: :new_user_session
  	post 'login', to: 'devise/sessions#create', as: :user_session
  	delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session

  	get 'signup', to: 'devise/registrations#new'
  end

  resources :dining_experiences, except: [:new]
  resources :create_restaurant_experiences, only: [:new, :create]

  root 'static_pages#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
