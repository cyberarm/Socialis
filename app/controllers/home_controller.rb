class HomeController < ApplicationController
  def index
	  @latest = Status.find(:all, :limit => 3)
	  @user = User.find(:all, :limit => 5, :order => "id DESC")
  end

  def about
    @status = Status.find(:all)
    @users = User.find(:all)
  end

  def help
  end

end
