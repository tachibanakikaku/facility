class ShopsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  # attr_accessible :title, :body
end
