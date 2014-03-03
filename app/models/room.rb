class Room < ActiveRecord::Base
  attr_accessible :name
  track_who_does_it
end
