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
        # インスタンスを格納
        @user = User.new
     end

    #  新規登録情報をセーブ
    def create
        @user = User.new(
            name: params[:name],
            email: params[:email],
            password: params[:password]
            )
        # 入力されたデータが保存できたら
        if @user.save
            # 新規登録時にログイン状態にする
            session[:user_id] = @user.id
            # サクセスメッセージを追加して詳細ページへ転送
            flash[:notice] = "登録されました! #{@user.name}"
            redirect_to("/users/#{@user.id}")
        else
            flash[:notice] = "エラーが発生しました"
            render('users/new')
        end
    end

    # ログインフォーム
    def login_form

    end
    # ログイン認証
    def login
    # 入力された値と一致するものをfind_byで特定し代入（該当するユーザーを特定）
    @user = User.find_by(email: params[:email], password: params[:password])
        # 存在する場合
        if @user
             # 特定したユーザーのIDをブラウザに記憶させる(ログインユーザーの情報を保持)
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました! #{@user.name}"
            redirect_to("/users/index")
        # 認証失敗
        else
            # エラーメッセージ
            @error_message = "メールアドレスかパスワードが間違っているか、登録されていません"
            # 初期値
            @email = params[:email]
            @password = params[:password]
            # やり直し
            render("users/login_form")
        end
    end


end
