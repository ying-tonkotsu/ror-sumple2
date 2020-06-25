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
        @user = User.new
     end

    #  新規登録情報をセーブ
    def create
        @user = User.new(
            name: params[:name],
            email: params[:email],
            password: params[:password]
            )
        if @user.save
            flash[:notice] = "登録が完了しました"
            redirect_to("/users/#{@user.id}")
        else
            flash[:notice] = "エラーが発生しました"
            render('users/new')
        end
    end
end
