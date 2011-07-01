class ApplicationController < ActionController::Base
  
  # Include Authentication Controller
  include ControllerAuthentication
  protect_from_forgery
end
