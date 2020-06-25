Rails.application.routes.draw do
  # ユーザー一覧
  get '/users/index' => 'users#index'
  # ユーザー詳細
  get '/users/:id' => 'users#show'
  # 新規登録
  get '/signup' => 'users#new'
  # サイトマップへ飛ばす
  get '/' => 'top#sitemap'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
