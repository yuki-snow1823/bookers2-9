Rails.application.routes.draw do
  get 'chat/show'
  get '/search' => 'search#search', as: 'search'
  # get 'relationships/create'
  # get 'relationships/destroy'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
# これのおかげで最初に動く:メールを送るため

  # 順番上にあげた
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加　多分不要
    get :followers, on: :member # 追加　多分不要
    # get :search, on: :collection
  end


  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    # get :search, on: :collection
    # GET /books/searchでBooksコントローラのsearch アクションにルーティングされるようになります。
  end
  

  # 直るまでコメントアウト

  root 'home#top'
  get 'home/about'
end