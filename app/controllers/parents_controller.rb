class ParentsController < ApplicationController
	
  #############################################
  # Sets up the view for creating a new child
  ##############################################
  def new
    @parent = Parent.new
  end
  
  
  #############################################
  # Attempts to store a new child with the passed
  # attributes in the database; goes to new child's
  # profile page on success, and to "new" view on
  # failure
  ##############################################
  def create
    @parent = Parent.new(child_params)
    if @parent.save
	  sign_in @parent unless signed_in?
	  flash[:success] = "Signup successful"
      redirect_to @parent
    else
      render 'new'
    end
  end
  
  
  #############################################
  # 
  ##############################################
  def show
    @parent = Parent.find(params[:id])
  end
  
  
  #############################################
  # 
  ##############################################
  def index
    @parents = Parent.all
  end

  
  #############################################
  # 
  ##############################################
  def edit
    @parent = Parent.find(params[:id])
  end
  

  #############################################
  # Attempts to update a child's information
  ##############################################
  def update
	# no longer needed since the before_filter actions already
	# initialize this variable
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(child_params)
      flash[:success] = "Profile updated"
      redirect_to @parent
    else
      render 'edit'
    end
  end

  
  #############################################
  # Attempts to delete the child with the passed
  # ID
  ##############################################
  def destroy
	if Parent.find(params[:id]).destroy
		flash[:success] = "Parent deleted."
	else
		flash[:error] = "There was a problem deleting this child."
	end
    redirect_to parents_url
  end
  
  private

    #############################################
    # Strong parameters for Parent model
    ##############################################
    def parent_params
      params.require(:parent).permit(:fname, :lname, :rate,
 :parent_one_id,
 :parent_two_id,
 :p1_fname,
 :p1_lname,
 :p1_email,
 :p1_street_addr,
 :p1_city,
 :p1_zip,
 :p1_state,
 :p1_phone_home,
 :p1_phone_cell,
 :p1_phone_work,
 :p2_fname,
 :p2_lname,
 :p2_email,
 :p2_street_addr,
 :p2_city,
 :p2_zip,
 :p2_state,
 :p2_phone_home,
 :p2_phone_cell,
 :p2_phone_work)
    end

end
