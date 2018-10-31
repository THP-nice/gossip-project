Rails.application.routes.draw do
  resources :static_pages
  resources :gossips
  root 'static_pages#home'
end
