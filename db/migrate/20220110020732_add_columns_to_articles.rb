class AddColumnsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :title, :string, null: false
    add_column :articles, :body, :test, null: false
    add_column :articles, :member_only, :boolen
  end
end
