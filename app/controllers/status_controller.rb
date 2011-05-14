class StatusController < ApplicationController
before_filter :login_required, :except => [:index, :show]

  def index
    # List all the staatuses users have made
    @status = Status.order('created_at').page(params[:page]).per(5)
    @status_paginate = Status.order('created_at').page(params[:page]).per(5)
    respond_to do |format|
  format.html
  format.json { render :json => @status }
end
end

  def show
	   @userl = Status.find_by_author(params[:id])
  # We want users to be able to share and view there status	
  	@status = Status.find_by_shortened(params[:id])
  	@statusdel = Status.find_by_shortened(params[:id])
	respond_to do |format|
  format.html
  format.json { render :json => @status }
end

end

def create  
  # Users can create statuses
    @status = Status.create(:message => params[:message], :author => params[:author])  
    respond_to do |format|  
      if @status.save  
	      flash[:notice] = "Status Saved"
        format.html { redirect_to "/statuses" }  
      else  
        flash[:notice] = "Message failed to save."  
        format.html { redirect_to "/status/new" }  
      end  
    end  
  end 
 
  
  def destroy
  # If a users wants to delete a status, let them
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(status_url) }
      format.xml  { head :ok }
    end
  end
end
