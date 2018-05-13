Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles, path: 'blog' do
    resources :comments
  end

  root 'welcome#index'
end
