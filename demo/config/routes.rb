Rails.application.routes.draw do

	devise_for :users
  
	root to: 'blogs#home'

 	resources :blogs do
 		member do
 			delete :delete_picture_attachment
 		end
 	end	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 