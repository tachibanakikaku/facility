class ApplicationController < ActionController::Base
  include SentientController

  protect_from_forgery
  before_filter :authenticate_user!

  private

  def load_shops
    @shops = Shop.all
  end
end
