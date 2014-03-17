class UsersController < ApplicationController
	# only signed-in users can use the edit or update actions
	before_action :signed_in_user, only: [:edit, :update, :index]
	
	# users can only edit their own information
	before_action :correct_user,   only: [:edit, :update]
	
	# sets up an autocomplete action for users' last name
	autocomplete :user, :lname, :display_value => :full_name, :extra_data => [:fname]

  def new
    @user = User.new
  end
  
  #############################################
  # Attempts to store a new user with the passed
  # attributes in the database; goes to new user's
  # profile page on success, and to "new" view on
  # failure
  ##############################################
  def create
    @user = User.new(user_params)
    if @user.save
	  sign_in @user
	  flash[:success] = "Signup successful"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end

  #############################################
  # 
  ##############################################
  def edit
	# no longer needed since the before_filter actions already
	# initialize this variable
    #@user = User.find(params[:id])
  end

  def update
	# no longer needed since the before_filter actions already
	# initialize this variable
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
	User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  private

    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password,
                                   :password_confirmation, :phone_home,
								   :phone_cell, :phone_work, :ssn, :street_addr,
								   :city, :state, :zip)
    end
end
