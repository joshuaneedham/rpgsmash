Rails.application.routes.draw do
  devise_for :users
  get 'welcome/home'

  root 'welcome#home'

  resources :universes do
  	resources :traits, :characters
  end

end
