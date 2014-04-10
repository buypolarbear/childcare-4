class ChildArriveDepartController < ApplicationController

  def last_names
	@children = Child.find(:all, :order => "lname desc")
  end

  #############################################
  # This is executed when the child_arrive_depart#children
  # controller method is called with the "js"
  # format (i.e. AJAX call instead of a redirect).
  # Sets variables and passes rendering control
  # on to children.js.erb
  ##############################################
  def children
	@child = Child.find(params[:id])
	@parents = @child.parents.all
	respond_to do |format|
		format.js { }
	end
  end
  
  
  #############################################
  # If the child whose parent was selected is
  # currently signed in, sign the child out.
  # Otherwise, sign the child in
  ##############################################
  def toggle_signin
  
	@child = Child.find(params[:child_id])
	@parent_guardian = Parent.find(params[:parent_guardian_id])
	respond_to do |format|
		format.js { }
	end
	
	# if signed_in
		# sign out
	# else
		# sign in
  
  end
  
end
