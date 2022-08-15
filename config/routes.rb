Rails.application.routes.draw do

  root "articles#index"

  get '/persons/profile', to: 'persons#profile'
  get '/my_articles', to: 'articles#my_articles'
  #delete '/articles/:id/delete_files', to: 'articles#delete_files', as: :delete_files_article
  resources :articles do
    member do 
      delete :delete_files
    end
  end
  devise_for :users
##(No route matches [GET] "/users/sign_out") was not working, until i have added this. Why? Idk, why did devise dev do it?##
  devise_scope :user do  
  get '/users/sign_out' => 'devise/sessions#destroy'     
end
######################################################

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
