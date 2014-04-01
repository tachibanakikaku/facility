class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.datetime :begins_at
      t.datetime :ends_at

      ## clerk columns
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
