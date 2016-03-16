Rails.application.routes.draw do

  root 'pages#home'

  get '/home', to: 'pages#home'

  
  # get '/recipes', to: 'recipes#index'
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe' # 'as' path to show up
  # otherwise it will be 'recipes_new' (from 'get' part)

  # post '/recipes', to: 'recipes#create'
  # get 'recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'

  # to handle edit_recipe path
  # edit_recipe would render a form
  # this handles submission of that template
  # patch request
  # patch '/recipes/:id', to: 'recipes#update'

  # show single recipe
  # get 'recipes/:id', to: 'recipes#show', as: 'recipe'

  # delete recipe
  # delete '/recipes/:id', to: 'recipes#destroy'

  #.. or simply put 'resources :recipes' and get rid of all of these

  resources :recipes

end
