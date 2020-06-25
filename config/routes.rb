Rails.application.routes.draw do
  # ユーザー一覧
  get '/users/index' => 'users#index'


  # サイトマップへ飛ばす
  get '/' => 'top#sitemap'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
