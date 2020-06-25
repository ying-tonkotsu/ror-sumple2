class UsersController < ApplicationController
    # ユーザー一覧
    def index
        @users = User.all
    end

end
