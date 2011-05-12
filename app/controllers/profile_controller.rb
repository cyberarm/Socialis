class ProfileController < ApplicationController
before_filter :login_required
	def index
	 # The user should know want information we have
		@my_statuses = Status.find_all_by_author(current_user.username)
		@my_latest_status = Status.find_all_by_author(current_user.username, :limit => 1)
	end

	def show
	  # We want users to have a profile page
		 @userl = User.find_by_username(params[:id])
		 
		# We want the users statuses on there profile page
		 @user_statuses = Status.where(:author => @userl.username).order('created_at')
		 @user_statuses = @user_statuses.page(params[:page]).per(5)
	end
end
