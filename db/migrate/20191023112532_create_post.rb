class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.json :images, null:false
      t.timestamps
    end
  end
end