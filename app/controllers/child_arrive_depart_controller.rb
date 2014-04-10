class ChildArriveDepartController < ApplicationController
  def last_names
	@letters = ('A'..'Z').to_a
  end

  def children
	@first_letter = params[:first_letter]
	@children = []
	Child.all.each_with_index do |child, i|
		if child.lname[0].casecmp(@first_letter) == 0
			@children << child
		end
	end
	
	puts @children
	
	respond_to do |format|
		format.js { render :partial => 'parents', :locals =>
			{
				:children => @children,
				:first_letter => params[:first_letter]
			}
		}
	end
  end

end
