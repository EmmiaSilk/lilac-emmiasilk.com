Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :articles, path: 'blog' do
    resources :comments
  end

  root 'welcome#index'
end
