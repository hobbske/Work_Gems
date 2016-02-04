Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'omniauth_callbacks'}
  resources :users do
    resources :samples
    resource :profile
  end

  resources :feedbacks

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


  # post '/users/:user_id/samples' => 'samples#create'
  get '/about' => 'pages#about'
  root 'pages#home'
  
end
