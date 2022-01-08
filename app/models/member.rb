class Member < ApplicationRecord

  validates :nickname, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]+\z/, allow_blank: true, message: "は半角英数字で入力してください。" },
    length: { minimum: 2, maximum: 20,allow_blank: true},
    uniqueness: { case_sensitive: false}

  validates :full_name, presence: true, length: { maximum: 20}
  
  # DBに保存する前にメールアドレスを小文字にする
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # 一意性（メールアドレスが他のユーザーと被らないように）の検証
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}



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
