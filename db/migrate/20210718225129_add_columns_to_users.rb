class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :url, :text
    add_column :users, :admin, :boolean, default: false
    add_column :users, :club_id, :integer
  end
end
