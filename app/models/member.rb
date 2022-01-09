class Member < ApplicationRecord
  has_secure_password
  
  # ニックネーム
  validates :nickname, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]+\z/, allow_blank: true, message: "は半角英数字で入力してください。" },
    length: { minimum: 2, maximum: 20,allow_blank: true},
    uniqueness: { case_sensitive: false}
  
  # 氏名
  validates :full_name, presence: true, length: { maximum: 20}
  
  # メールアドレス
  # DBに保存する前にメールアドレスを小文字にする
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # 一意性（メールアドレスが他のユーザーと被らないように）の検証
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  
  # パスワード
  # accessorメソッド（読み書き療養のメソッド）
  attr_accessor :current_member
  validates :password, presence: { if: :current_password}


  class << self
    def search(query)
      rel = order(params[:id])
      if query.present?
        rel = rel.where("nickname LIKE ? OR full_name LIKE ?",
        "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
