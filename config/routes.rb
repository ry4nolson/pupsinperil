Rails.application.routes.draw do
  root "static_pages#home"
  
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'about_2', to: redirect("/about", status:301)
  get 'our-dogs', to: 'static_pages#adoptable_dogs'
  get 'adoption', to: 'static_pages#adoption'
  get 'contact-us', to: 'static_pages#contact_us'
  get 'foster-application', to: 'static_pages#foster'
  get 'donate', to: 'static_pages#donate'
  get 'happy-tails', to: 'static_pages#happy_tails'
  get 'happy-tails-2', to: redirect("/happy-tails", status:301)
  
  post 'ajax/save/:block', to: 'ajax#save'
  get 'happy-tails/load/:next', to: 'static_pages#happy_tails'
  get 'home/load/:next', to: 'static_pages#home'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
