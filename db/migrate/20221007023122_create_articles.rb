class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :address
      t.float :lat
      t.float :lng
      t.timestamps null: false
    end
  end
end
