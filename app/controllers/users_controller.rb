class UsersController < ApplicationController
    # ゲストユーザーへの処理
    before_action :authenticate_user,{only: [:index, :show, :edit, :update]}
    # 既にログイン済みのユーザーへの処理
    before_action :forbid_login_user,{only: [:login_form, :login, :new, :create]}

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
            password: params[:password],
            # デフォルト画像
            image_name: "default.jpg"
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

    # アカウント情報の編集
    def edit
        # URLからIDを取得
        @user = User.find_by(id: params[:id])
    end
    #更新
    def update
        # URLからIDを取得し、ユーザー情報を格納
        @user = User.find_by(id: params[:id])
        # 入力されたデータを格納
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]

        # 画像が入力されていたら
        if params[:image]
        # ファイル名をユーザーIDに指定
            @user.image_name = "#{@user.id}.jpg"
            #入力されたファイルを格納
            image = params[:image]
            # public/user_imagesフォルダに画像データを格納
            File.binwrite("public/user_images/#{@user.image_name}",image.read)
        end

        # データを更新
        if @user.save
            #保存できたら、サクセスメッセージを表示してユーザー詳細ページへ転送
            flash[:notice] = "アカウント情報が更新されました"
            redirect_to("/users/#{@user.id}")
        else
            # 失敗した場合は入力画面に戻す
            render("users/edit")
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
            flash[:notice] = "ログインしました"
            redirect_to("/users/index")
        # 認証失敗
        else
            # エラーメッセージ
            @error_message = "メールアドレスまたはパスワードが間違っているか、登録されていません"
            # 初期値
            @email = params[:email]
            @password = params[:password]
            # やり直し
            render("users/login_form")
        end
    end

    # ログアウト処理
    def logout
        # セッションIDを削除
        session[:user_id] = nil
        # メッセージ
        flash[:notice] = "ログアウトしました"
        # ログインページへ転送
        redirect_to("/login")
    end

    # 既にログイン済みのユーザーへの処理
    def forbid_login_user
        if @current_user
            flash[:notice] = "既にログインしています"
            redirect_to("/")
        end
    end

end
