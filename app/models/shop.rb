class Shop < ActiveRecord::Base
  attr_accessible :name
  track_who_does_it

  has_many :users, through: :shops_users
  has_many :shops_users
end
