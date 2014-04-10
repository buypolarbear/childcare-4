class ChildArriveDepartController < ApplicationController
  def last_names
	@letters = ('A'..'Z').to_a
	@children = Child.find(:all, :order => "lname desc")
  end

  def children
	@child = Child.find(params[:id])
	@parents = @child.parents.all
	respond_to do |format|
		format.js { }
	end
  end
  
end
