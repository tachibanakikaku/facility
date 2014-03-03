class ApplicationController < ActionController::Base
  include SentientController

  protect_from_forgery
  before_filter :authenticate_user!
end
