class ChildArriveDepartController < ApplicationController
  def last_names
	@letters = ('A'..'Z').to_a
  end

  def children
	@first_letter = params[:first_letter]
	@children = []
	User.all.each_with_index do |child, i|
		if child.lname[0].casecmp(@first_letter) == 0
			@children << child
		end
	end
  end

  def parents
	@child = User.find(params[:child_id])
  end
end
