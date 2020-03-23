Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :adventures do
    resources :comments
  end
  resources :destinations do
    resources :destinationcomments
  end
  resources :parks do
    resources :parkcomments
  end
  get '/search' => 'adventures#search', :as => 'search_page'
  get '/searchdestination' => 'destinations#search', :as => 'searchdestination_page'
  get '/searchpark' => 'parks#search', :as => 'searchpark_page'
  get 'about', to: 'welcome#about'
end
