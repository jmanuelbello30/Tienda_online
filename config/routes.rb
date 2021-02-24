Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # The navigation paths of the application are defined.

  root 'home#index'
  get  '/:category_id', to: 'home#index'
  post '/',             to: 'home#index'
  

end
