Rails.application.routes.draw do
  root 'pages#home'
  get 'home', to: 'pages#home'
  
 
 # get '/recipes', to: 'recipes#index'
 # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
 # post '/recipes', to: 'recipes#create' #handle the form of new recipe by create function
 # get '/recipes/:id/edit', to: 'recipe#edit', as: 'edit_recipe'
 # patch '/recipes/:id', to: 'recipes#update' #update will handle edit recipe form request
 # get 'recipes/id' , to: 'recipes#show', as: 'recipe'
 # delete '/recipes/:id', to: 'recipes#destroy' #for deleting the recipe
 
 
  #rails magic, all the above routes is defined in resources :recipes
  resources :recipes do 
      member do
          post 'like'
      end
  end
  
  
  
  
end
