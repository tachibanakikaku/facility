class Reservation < ActiveRecord::Base
  attr_accessible :room_id, :user_id
end
