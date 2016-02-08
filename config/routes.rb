Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :users do
    resources :samples
    resource :profile
  end

  resources :feedbacks

  get '/about' => 'pages#about'
  root 'pages#home'
  
end
