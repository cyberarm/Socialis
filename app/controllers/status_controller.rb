class StatusController < ApplicationController
before_filter :login_required, :except => [:index, :show]

  # List all the statuses users have made
  def index
    @userl = User.find_by_username(params[:id]) || User.find_by_id(params[:id])
    @status = Status.order('created_at').page(params[:page]).per(10)
    #@statusdel = Status.find_by_shortened(params[:id])
    @status_paginate = Status.order('created_at').page(params[:page]).per(10)
    respond_to do |format|
  format.html
  format.json { render :json => @status }
end
end

  # We want users to be able to share and view there status 
  def show
    @userl = Status.find_by_author(params[:id])
  	@status = Status.find_by_shortened(params[:id])
  	@statusdel = Status.find_by_shortened(params[:id])
	respond_to do |format|
  format.html
  format.json { render :json => @status }
end

end

# Users can create statuses
def create  
    @status = Status.create(:message => params[:message], :author => params[:author], :email => params[:email])  
    respond_to do |format|  
      if @status.save  
	      flash[:notice] = "Status created successfully."
        format.html { redirect_to "/statuses" }  
      else  
        flash[:notice] = "Status failed to save. Please try again soon."  
        format.html { redirect_to "/status/new" }  
      end  
    end  
  end 
 
  # If a users wants to delete a status, let them
  def destroy
    @status = Status.find(params[:id])
    if @status.destroy
      flash[:notice] = "Status deleted."
    else
      flash[:error] = "Status did not delete. Try again later."
    end
    respond_to do |format|
      format.html { redirect_to(status_url) }
      format.xml  { head :ok }
    end
  end
end
