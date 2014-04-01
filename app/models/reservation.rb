class Reservation < ActiveRecord::Base
  attr_accessible :room_id, :user_id, :begins_at, :ends_at
  track_who_does_it

  belongs_to :room
  belongs_to :user
end
