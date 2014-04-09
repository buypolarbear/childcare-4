class Parent < ActiveRecord::Base
	has_and_belongs_to_many :children
	
	
	####################################
	# Returns the first,
	# middle, and last names of the
	# parent concatenated into a friendly
	# string
	####################################
	def full_name
		"#{fname} #{lname}"
	end
	
end
