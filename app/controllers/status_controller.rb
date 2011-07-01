class StatusController < ApplicationController
before_filter :login_required, :except => [:index, :show]

  # List all the statuses users have made
  def index
    @userl = User.find_by_username(params[:id]) || User.find_by_id(params[:id])
    @status = Status.order('created_at').page(params[:page]).per(5)
    #@statusdel = Status.find_by_shortened(params[:id])
    @status_paginate = Status.order('created_at').page(params[:page]).per(5)
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
	      flash[:notice] = "Status Saved"
        format.html { redirect_to "/statuses" }  
      else  
        flash[:notice] = "Status failed to save."  
        format.html { redirect_to "/status/new" }  
      end  
    end  
  end 
 
  # If a users wants to delete a status, let them
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(status_url) }
      format.xml  { head :ok }
    end
  end
end