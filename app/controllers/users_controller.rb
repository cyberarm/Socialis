class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :index]

  # List of Users
  def index
  @user =  User.order('created_at DESC').page(params[:page]).per(8)
  end

  # Create a new User
  def new
    @user = User.new
  end
  
  # Create a new User
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  # Edit a users profile
  def edit
    @user = current_user
  end
  
  # Edit a users profile
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to "/profile", :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
end
