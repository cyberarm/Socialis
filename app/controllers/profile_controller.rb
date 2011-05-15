class ProfileController < ApplicationController
before_filter :login_required, :only => [:index]
	def index
	 # The user should know want information we have
		@where_is_my_statuses = Status.where(:author => current_user.username).order('created_at')
     @my_statuses = @where_is_my_statuses.page(params[:page]).per(3)
		@my_latest_status = Status.find_all_by_author(current_user.username, :limit => 1)
	end

	def show
	  # We want users to have a profile page
		 @userl = User.find_by_username(params[:id])

		 # We want to show the users latest Status
		@user_latest_status = Status.find_all_by_author(@userl.username, :limit => 1) 

		# We want the users statuses on there profile page
		 @user_statuses = Status.where(:author => @userl.username).order('created_at')
		 @user_statuses = @user_statuses.page(params[:page]).per(3)
	end
end
