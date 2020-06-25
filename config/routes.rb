Rails.application.routes.draw do
  # ユーザー一覧
  get '/users/index' => 'users#index'
    # 新規登録
  get '/signup' => 'users#new'
  # 新規登録情報を保存
  post '/users/create' => 'users#create'

  # ログインフォーム
  get '/login' => 'users#login_form'
  # ユーザー詳細
  get '/users/:id' => 'users#show'



  # サイトマップへ飛ばす
  get '/' => 'top#sitemap'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
