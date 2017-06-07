Rails.application.routes.draw do

	#root 'libcompls#index'

  resources :libcompls do
  	get "delete"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
