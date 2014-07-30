Rails.application.routes.draw do
	resources :students, only: [] do
		resources :lessons, only: [:update]
	end
end
