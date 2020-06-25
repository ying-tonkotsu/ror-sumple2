class UsersController < ApplicationController
    # ユーザー一覧
    def index
        @users = User.all
    end

    # ユーザー詳細
    def show
        @user = User.find_by(id: params[:id])
    end

    # 新規作成（サインアップ）
     def new

     end
end
