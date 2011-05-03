class HomeController < ApplicationController
  def index
	  @latest = Status.find(:all, :limit => 3)
	  @user = User.find(:all, :limit => 5, :order => "id DESC")
  end

  def about
  end

  def help
  end

  def users
     @user = User.find(:all)
  end

end
