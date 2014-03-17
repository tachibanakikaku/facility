class User < ActiveRecord::Base
  include SentientUser

  attr_accessible :name, :email, :shop_ids, :password, :password_confirmation, :remember_me

  track_who_does_it
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shops, through: :shops_users
  has_many :shops_users
end
