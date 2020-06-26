Rails.application.routes.draw do

  # ログイン画面
  get 'login' => 'users#login_form'
  #「get」と「post」では異なるルーティングとして扱われるので問題ない。
  # ログイン処理
  #ログインフォームからデータを送信
  post 'login' => 'users#login'
 # ログアウト処理
 # sessionの値を変更するのでpost 　
  post 'logout' => 'users#logout'


  # ユーザー一覧
  get 'users/index' => 'users#index'
    # 新規登録
  get 'signup' => 'users#new'
  # 新規登録情報を保存
  post 'users/create' => 'users#create'
   # ユーザー詳細
  get 'users/:id' => 'users#show'
  # アカウント情報編集フォーム
  get 'users/:id/edit' => 'users#edit'
  # アカウント情報更新
  post 'users/:id/update' => 'users#update'
  # アカウントの削除
  post 'users/:id/destroy' => 'users#destroy'



  # サイトマップへ飛ばす
  get '/' => 'top#sitemap'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
