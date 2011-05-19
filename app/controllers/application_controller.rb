class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  def version
      @version = '0.0.0.65'
        respond_to do |format|
      format.json  { render :json => @version}
    end
  end
end
