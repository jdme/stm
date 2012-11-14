class ApplicationController < ActionController::Base
  include AuthHelper
  protect_from_forgery
  helper_method :current_user
  before_filter :require_auth
end
