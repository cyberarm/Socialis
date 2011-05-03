class StatusController < ApplicationController
before_filter :login_required, :except => [:index]

  def index
    @status = Status.order('created_at').page(params[:page]).per(5)
    @status_paginate = Status.order('created_at').page(params[:page]).per(5)
    respond_to do |format|
  format.html
  format.json { render :json => @status }
end
end

  
  # GET /status/1
  # GET /status/1.xml
  def show
  	
  	@status = Status.find_by_shortened(params[:id])
  	@statusdel = Status.find_by_shortened(params[:id])

end

def create  
    @status = Status.create(:message => params[:message], :author => params[:author])  
    respond_to do |format|  
      if @status.save  
	      flash[:notice] = "Status Saved"
        format.html { redirect_to "/status" }  
      else  
        flash[:notice] = "Message failed to save."  
        format.html { redirect_to "/status/new" }  
      end  
    end  
  end 
 
  
  def destroy
  	
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(status_url) }
      format.xml  { head :ok }
    end
  end
end
