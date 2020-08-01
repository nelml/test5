Rails.application.routes.draw do

  root 'users#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books

  get 'home/about' => 'books#about'
  post 'books/:id' => 'books#create'
  delete 'books/books/:id' => 'books#destroy', as: "delbook"
end
