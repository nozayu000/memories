Rails.application.routes.draw do
  get 'password/edit'
  get 'myaccounts/show'
  get 'myaccounts/edit'
  root "top#index"
  get "about" => "top#about", as: "about"

  # 1.upto(18) do |n|
  #   get "lesson/step#{n}(/:name)" => "lesson#step{n}"
  # end

  resources :members do
    get "search", on: :collection
  end
  # 単数リソース
  resource :session, only: [:create, :destroy]
  resource :myaccount, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
end
