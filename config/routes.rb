Rails.application.routes.draw do
	devise_for :models
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'static_pages#index'
	resources :courses, only: [:index, :show]
	namespace :instructor do
		 resources :courses, only: [:new, :ceate, :show] do
			resources :sections, only: [:name, :create]
	    end
    end
end
