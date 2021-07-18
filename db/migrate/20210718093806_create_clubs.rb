class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.integer :club_name
      t.text :description

      t.timestamps
    end
  end
end
