class Shop < ActiveRecord::Base
  attr_accessible :name

  has_many :users, through: :shops_users
  has_many :shops_users
end
