class Room < ActiveRecord::Base
  attr_accessible :name, :shop_id
  track_who_does_it

  belongs_to :shop
  has_many :users, through: :reservations
  has_many :reservations
end
