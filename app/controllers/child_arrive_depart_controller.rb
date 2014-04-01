class ChildArriveDepartController < ApplicationController
  def last_names
	
  end

  def children
	@children = []
	User.all.each_with_index do |child, i|
		if child.lname[0].casecmp(params[:first_letter]) == 0
			@children << child
		end
	end
  end

  def parents
	@child = User.find(params[:child_id])
  end
end
