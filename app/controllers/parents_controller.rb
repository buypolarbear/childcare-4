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
    @parent = Parent.new(parent_params)
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
      params.require(:parent).permit(:fname, :lname,
		:email,
		:street_addr,
		:city,
		:zip,
		:state,
		:phone_home,
		:phone_cell,
		:phone_work
	  )
    end

end
