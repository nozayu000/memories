class Blog < ApplicationRecord
  belongs_to :member

  validates :title, presence: true, length: {maximum: 50}
  validates :body, :posted_at, presence: true

end
