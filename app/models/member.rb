class Member < ApplicationRecord

  validates :nickname, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]+\z/, allow_blank: true, message: "半角英数字のみが使えます" },
    length: { minimum: 2, maximum: 20,allow_blank: true},
    uniqueness: { case_sensitive: false}

  validates :full_name, presence: true, length: { maximum: 20}
  validates :email, email: { allow_blank: true}


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
