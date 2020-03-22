Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :adventures do
    resources :comments
  end
  resources :destinations do
    resources :destinationcomments
  end
  get '/search' => 'adventures#search', :as => 'search_page'
  get 'about', to: 'welcome#about'
end
