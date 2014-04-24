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
  # Otherwise, sign the child in.
  ##############################################
  def toggle_signin
  
	@child = Child.find(params[:child_id])
	@parent_guardian = Parent.find(params[:parent_guardian_id])
	
	# create a new event for this child
	@event = @child.child_events.build(start_time: Time.now, parent_id: params[:parent_guardian_id])
	
	if !@child.save
		flash.now[:error] = "Event could not be logged"
		render child_signin_path
	else
		flash.now[:success] = "Event logged"
	end
	
	respond_to do |format|
		if @parent_guardian.verified? 
			format.js { } # just render the default toggle_signin.js.erb
		else
			format.js {  render :action => "toggle_signin_and_verify" } # render the OTHER js file
		end
	end
  
  end
  
  
end
