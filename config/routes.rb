Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/sun'
  get 'home/weather'
  post 'home/do_not_want'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
