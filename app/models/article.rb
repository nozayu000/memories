class Article < ApplicationRecord
  attachment :image
   
  validates :title, :body, presence: true
  validates :title, length: {maximum: 80 }
  validates :body, length: {maximum: 200 }
  validates :image, presence: true
 
end

