class ChildrenController < ApplicationController
	
  #############################################
  # Sets up the view for creating a new child
  ##############################################
  def new
    @child = Child.new
  end
  
  
  #############################################
  # Attempts to store a new child with the passed
  # attributes in the database; goes to new child's
  # profile page on success, and to "new" view on
  # failure
  ##############################################
  def create  
	@child = Child.new(child_params)	
	
	if (params[:parent_one_id].to_i > 0) && parent_one = Parent.find(params[:parent_one_id])
		@child.parents << parent_one
	end
	
	if (params[:parent_two_id].to_i > 0) && parent_two = Parent.find(params[:parent_two_id])
		@child.parents << parent_two
	end
	
    
    if @child.save
	  sign_in @child unless signed_in?
	  flash[:success] = "Signup successful"
      redirect_to @child
    else
      render 'new'
    end
  end
  
  
  #############################################
  # 
  ##############################################
  def show
    @child = Child.find(params[:id])
  end
  
  
  #############################################
  # 
  ##############################################
  def index
    @children = Child.all
  end

  
  #############################################
  # 
  ##############################################
  def edit
    @child = Child.find(params[:id])
  end
  

  #############################################
  # Attempts to update a child's information
  ##############################################
  def update
	# no longer needed since the before_filter actions already
	# initialize this variable
    @child = Child.find(params[:id])
    if @child.update_attributes(child_params)
      flash[:success] = "Profile updated"
      redirect_to @child
    else
      render 'edit'
    end
  end

  
  #############################################
  # Attempts to delete the child with the passed
  # ID
  ##############################################
  def destroy
	if Child.find(params[:id]).destroy
		flash[:success] = "Child deleted."
	else
		flash[:error] = "There was a problem deleting this child."
	end
    redirect_to children_url
  end
  
  private

    #############################################
    # Strong parameters for Child model
    ##############################################
    def child_params
		params.require(:child).permit(:fname, :lname, :rate_id,
			parents_attributes: [
				:id,
				:fname,
				:lname,
				:email,
				:street_addr,
				:city,
				:zip,
				:state,
				:phone_home,
				:phone_cell,
				:phone_work
			]
		)
    end

end
