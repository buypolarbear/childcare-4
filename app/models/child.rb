class Child < ActiveRecord::Base
	has_and_belongs_to_many :parents
	
	####################################
	# Returns the first,
	# middle, and last names of the
	# user concatenated into a friendly
	# string
	####################################
	def full_name
		"#{fname} #{lname}"
	end
end
