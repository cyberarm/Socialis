class ProfileController < ApplicationController
before_filter :login_required, :only => [:index]
  
  # The user should know want information we have
	def index
	  @where_is_my_statuses = Status.where(:author => current_user.username).order('created_at')
    @my_statuses = @where_is_my_statuses.page(params[:page]).per(3)
    @my_latest_status = Status.find_all_by_author(current_user.username, :limit => 1)
		#@friend = current_user.friendships.find(params[:id])
	end

	# We want users to have a profile page
	def show
	   @userl = User.find_by_username(params[:id]) || User.find_by_id(params[:id])
		 @statuses = Status.find_all_by_author(@userl.username)
	end
	
	# Show the users friends
	def friends
	 @userl = User.find_by_username(params[:id]) || User.find_by_id(params[:id])
	end
	
	# show the users statuses
	def statuses
	 @userl = User.find_by_username(params[:id]) || User.find_by_id(params[:id])
	 @user = User.find_by_username(params[:id])
	 @statuses = Status.find_all_by_author(@userl.id || @userl.username) 
	 
     # We want to show the users latest Status
    @user_latest_status = Status.find_all_by_author(@userl.username || @userl.id, :limit => 1) 

    # We want the users statuses on there profile page
     @user_statuses = Status.where(:author => @userl.username || @userl.id).order('created_at')
     @user_statuses = @user_statuses.page(params[:page]).per(3)
	end
end