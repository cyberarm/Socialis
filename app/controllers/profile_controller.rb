class ProfileController < ApplicationController
before_filter :login_required
	def index
		@my_statuses = Status.find_all_by_author(current_user.username)
	end

	def show
		 @userl = User.find_by_username(params[:id])
		 @user_statuses = Status.find_all_by_author(@userl.username)
	end
end
