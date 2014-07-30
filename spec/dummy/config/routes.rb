Rails.application.routes.draw do
	resources :users, only: [] do
		resources :posts, only: [:update]
	end
end
