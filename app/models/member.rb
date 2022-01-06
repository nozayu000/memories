class Member < ApplicationRecord
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
