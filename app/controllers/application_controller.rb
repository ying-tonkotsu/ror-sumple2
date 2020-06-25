class ApplicationController < ActionController::Base
    # 全コントローラーに共通のアクション
    before_action :set_current_user
# set_current_userメソッドを定義する
# ログイン中のユーザー
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
end
