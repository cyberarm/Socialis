class HomeController < ApplicationController
  
  # Homepage
  def index
	  @latest = Status.find(:all, :limit => 3)
	  @user = User.find(:all, :limit => 5, :order => "id DESC")
  end
  
  # About Socialis and Stats
  def about
    @status = Status.find(:all)
    @users = User.find(:all)
  end
  
  # Help page
  def help
  end
  
  
  # Gets the Version of Socialis when visiting '/version.json'
  def lookup_version
     @version = '0.0.0.70'
     respond_to do |format|
     format.json  { render :json => @version}
    end
  end

end
