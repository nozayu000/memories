Rails.application.routes.draw do
  get 'myaccounts/show'
  get 'myaccounts/edit'
  root "top#index"
  get "about" => "top#about", as: "about"

  resources :members do
    get "search", on: :collection
  end
  # 単数リソース
  resource :session, only: [:create, :destroy]
  resource :myaccount, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  

  resources :articles
  
end
