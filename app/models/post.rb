class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: {maximum: 80 }
  validates :body, length: {maximum: 200 }
end
