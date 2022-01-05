class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :nickname, null: false  
      t.string :full_name
      t.string :email
      t.date :birthday
      t.integer :public, null: false, default: 1  #情報公開（１：公開、２：非公開）
      t.boolean :administrator, null: false, default: false
      t.timestamps
    end
  end
end
