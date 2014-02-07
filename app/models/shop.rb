class Shop < ActiveRecord::Base
  attr_accessible :name

  has_many :users, through: :shops_users
end
