class Child < ActiveRecord::Base
	has_and_belongs_to_many :parents
	accepts_nested_attributes_for :parents, allow_destroy: true
	
	belongs_to :rate
	
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
