Rails.application.routes.draw do
  get 'tags/new'
  get 'tags/create'
  get 'tags/edit'
  get 'tags/update'
  get 'tags/destroy'
  get 'cards/new'
  get 'cards/create'
  get 'cards/edit'
  get 'cards/update'
  get 'cards/destroy'
  get 'cards/show'
  get 'containers/new'
  get 'containers/create'
  get 'containers/edit'
  get 'containers/update'
  get 'containers/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :profile_traits, except: :destroy

  resources :containers, except: %i[index show destroy] do
    resources :cards, except: :index do
      resources :tags, only: %i[new create]
    end
  end

  resources :containers, only: :destroy
  resources :tags, only: %i[destroy edit update]

  get "dashboard", to: "pages#dashboard", as: "dashboard"
  get "about", to: "pages#about", as: "about"
  get "plan", to: "pages#plan", as: "plan"
  get "profile", to: "pages#profile", as: "profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
