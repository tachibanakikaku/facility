class ReservationsController < ApplicationController
  before_filter :load_users

  def index
  end

  def load_users
    @users = User.all
  end
end
