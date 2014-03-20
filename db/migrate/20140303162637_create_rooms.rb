class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :shop_id

      ## clerk columns
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
