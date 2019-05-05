Rails.application.routes.draw do

	get 'collections/:id/collection_notes' => 'collections#collection_notes', :as => :collection_collection_note
	get "/users/:id", to: "users#show"

	

  resources :collection_note_attachments
  resources :collection_notes
  resources :collections
  resources :note_attachments  
  get "logout" => "session#destroy", :as => "logout"
  get "login" => "session#new", :as => "login"
  post "login" => "session#create"
  get "signup" => "users#new", :as => "signup"
  get "friend_requests" => "users#friend_requests", :as => "friend_requests"
  get "friends" => "users#friends", :as => "friends"

  resources :users
  resources :session
  resources :notes
  
  root :to => "notes#index"
  
  
 

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
