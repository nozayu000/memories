Rails.application.routes.draw do
  get 'blogs/new'
  get 'blogs/index'
  get 'blogs/show'
  get 'blogs/edit'
  get 'myaccounts/show'
  get 'myaccounts/edit'
  root "top#index"
  get "about" => "top#about", as: "about"

  resources :members do
    get "search", on: :collection
    # ◯◯さん(member)の記事(blog)→ネストさせる
    resources :blogs, only: [:index]
  end
  # 単数リソース
  resource :session, only: [:create, :destroy]
  resource :myaccount, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]

  resources :articles
  resources :blogs

end
