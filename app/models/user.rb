class User < ApplicationRecord
    # バリデーション

    # ユーザー名
    # 必須
    validates :name, {presence: true}

    # メールアドレス
    # 必須　重複不可
    validates :email, {presence: true, uniqueness: true}
    
    # パスワード
    # 必須
    validates :password, {presence: true}
end
