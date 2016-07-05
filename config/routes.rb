Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :posts
  root 'posts#index'
end
