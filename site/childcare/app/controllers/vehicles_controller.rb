class VehiclesController < ApplicationController

	# only signed-in users can use the edit or update actions
	before_action :signed_in_user, only: [:edit, :update, :index]
	
	# users can only edit their own information
	#before_action :correct_user,   only: [:edit, :update]
	
	# sets up an autocomplete action for users' last name
	#autocomplete :user, :lname, :display_value => :full_name, :extra_data => [:fname]

  def new
    @vehicle = Vehicle.new
  end
  
  #############################################
  # Attempts to store a new user with the passed
  # attributes in the database; goes to new user's
  # profile page on success, and to "new" view on
  # failure
  ##############################################
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
	  flash[:success] = "Vehicle successfully created"
      redirect_to @vehicle
    else
      render 'new'
    end
  end
  
  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
  def index
    @vehicles = Vehicle.all
  end

  #############################################
  # 
  ##############################################
  def edit
	# no longer needed since the before_filter actions already
	# initialize this variable
    #@user = User.find(params[:id])
	@vehicle = Vehicle.find(params[:id])
  end

  def update
	# no longer needed since the before_filter actions already
	# initialize this variable
    # @user = User.find(params[:id])
	@vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      flash[:success] = "Profile updated"
      redirect_to @vehicle
    else
      render 'edit'
    end
  end

  def destroy
	Vehicle.find(params[:id]).destroy
	redirect_to vehicles_url
  end
  
  private

    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :year,
									:license, :depreciation_rate, :user_id)
    end

    # Before filters

	# verifies that the current site user is signed in
    def signed_in_user
	  store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
	
	
	# checks to make sure that users can only edit their
	# own information
	def correct_user
      @user = User.find(params[:id])
      redirect_to root_url, notice: "You do not have permission to edit this user's information." unless current_user?(@user)
    end
end
