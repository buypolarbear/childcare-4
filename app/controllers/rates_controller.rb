class RatesController < ApplicationController

	autocomplete :rate, :name

  def new
    @rate = Rate.new
  end
  
  #############################################
  # Attempts to store a new user with the passed
  # attributes in the database; goes to new user's
  # profile page on success, and to "new" view on
  # failure
  ##############################################
  def create
    @rate = Rate.new(rate_params)
    if @rate.save
	  flash[:success] = "Rate successfully created"
      redirect_to @rate
    else
      render 'new'
    end
  end
  
  def show
    @rate = Rate.find(params[:id])
  end
  
  def index
    @rates = Rate.all
  end

  #############################################
  # 
  ##############################################
  def edit
	# no longer needed since the before_filter actions already
	# initialize this variable
    #@user = User.find(params[:id])
	@rate = Rate.find(params[:id])
  end

  def update
	# no longer needed since the before_filter actions already
	# initialize this variable
    # @user = User.find(params[:id])
	@rate = Rate.find(params[:id])
    if @rate.update_attributes(rates_params)
      flash[:success] = "Profile updated"
      redirect_to @rate
    else
      render 'edit'
    end
  end

  def destroy
	Rate.find(params[:id]).destroy
	redirect_to rates_url
  end
  
  private

    #############################################
    # Strong parameters for Rate model
    ##############################################
    def user_params
      params.require(:rate).permit(:name, :rate_per_unit, :unit)
    end
end
