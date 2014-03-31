class ChildArriveDepartController < ApplicationController
  def last_names
	
  end

  def children
	@children
	Child.all.each_with_index |child, i| do
		if child.lname[0] == params[:first_letter]
			@children += child
		end
	end	
  end

  def parents
  end
end
