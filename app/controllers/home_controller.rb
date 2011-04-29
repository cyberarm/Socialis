class HomeController < ApplicationController
  def index
	  @latest = Status.find(:all, :limit => 5)
	  @user = User.find(:all, :limit => 5)
  end

  def about
  end

end
