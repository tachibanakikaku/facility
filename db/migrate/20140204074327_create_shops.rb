class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name

      ## clerk columns
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
