class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notification_on_comment, :boolean, default: true, null: false
    add_column :users, :notification_on_follow, :boolean, default: true, null: false
    add_column :users, :notification_on_like, :boolean, default: true, null: false
  end
end