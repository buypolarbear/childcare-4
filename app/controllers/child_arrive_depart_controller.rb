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
  
end
