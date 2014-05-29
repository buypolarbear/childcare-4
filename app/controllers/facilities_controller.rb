#############################################
# 
##############################################
class FacilitiesController < ApplicationController


  #############################################
  # 
  ##############################################
  def show
    @facility = Facility.find(1)
  end
  
  
  #############################################
  # 
  ##############################################
  def edit
    @facility = Facility.find(1)
  end
  
  
  #############################################
  # Attempts to update a facility's information
  ##############################################
  def update
    @facility = Facility.find(1)
    if @facility.update_attributes(facility_params)
      flash[:success] = "Facility settings updated"
      redirect_to '/settings'
    else
      render '/settings'
    end
  end
  

  #############################################
  # 
  ##############################################
  def timespace
  end
  
  
  private

    #############################################
    # Strong parameters for Facility model
    ##############################################
    def facility_params
      params.require(:facility).permit(:business_name, :business_addr_one, :business_addr_two, :business_city,
										:business_state, :business_zip, :business_phone,
										:business_email, :exclusive_use_room)
    end
  
  
end
