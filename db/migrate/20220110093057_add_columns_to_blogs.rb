class AddColumnsToBlogs < ActiveRecord::Migration[5.2]
  def change
      add_column :blogs, :member_id, :integert
      add_column :blogs, :title, :string
      add_column :blogs, :body, :text
      add_column :blogs, :posted_at, :datetime
  end
end
