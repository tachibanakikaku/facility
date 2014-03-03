class AddClerkColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :created_by_id, :integer, after: :last_sign_in_ip
    add_column :users, :updated_by_id, :integer, after: :created_by_id
  end
end
