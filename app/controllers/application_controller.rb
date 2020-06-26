class ApplicationController < ActionController::Base
    # 全コントローラーに共通のアクション
    before_action :set_current_user
# set_current_userメソッドを定義する
# ログイン中のユーザー
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
# ゲストユーザーへの処理（URLを叩かれたらログインページへ弾く）
    def authenticate_user
        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/login")
        end
    end

end
