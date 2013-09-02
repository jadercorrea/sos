class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  skip_before_filter :require_no_authentication
  protect_from_forgery
end
