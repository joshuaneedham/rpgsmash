Rails.application.routes.draw do
  get 'welcome/home'

  root 'welcome#home'

  resources :universes do
  	resources :traits, :characters
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
