class FriendshipsController < ApplicationController
def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Added friend."
    redirect_to "/profiles/#{current_user.username}"
  else
    flash[:error] = "Unable to add friend, Try again?"
    redirect_to "/users"
  end
end

def destroy
  @friendship = current_user.friendships.find(params[:id])
  if @friendship.destroy
  flash[:notice] = "Removed friend."
  redirect_to "/profiles/#{current_user.username}/friends"
  else
	  flash[:notice] = "Unable to remove friend, Try again?"
   end
  end
end
