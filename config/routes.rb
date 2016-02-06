Rails.application.routes.draw do
  # get 'welcome/index'
  # get 'welcome/index'
resources :articles do
   resources :comments
end
end