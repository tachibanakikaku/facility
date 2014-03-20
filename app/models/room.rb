class Room < ActiveRecord::Base
  attr_accessible :name
  track_who_does_it

  has_many :users, through: :reservations
  has_many :reservations
end
