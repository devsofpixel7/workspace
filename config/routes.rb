Rails.application.routes.draw do

    root 'welcome#index'
    
    get '/home', to: 'pages#home'

end
