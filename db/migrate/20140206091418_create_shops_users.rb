class CreateShopsUsers < ActiveRecord::Migration
  def change
    create_table :shops_users do |t|
      t.references :user
      t.references :shop

      t.timestamps
    end
    add_index :shops_users, :user_id
    add_index :shops_users, :shop_id
  end
end
