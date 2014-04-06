class ChildrenController < ApplicationController
	
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
      params.require(:child).permit(:fname, :lname, :rate)
    end

end
