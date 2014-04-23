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
	
	
	####################################
	# Sets this parent's verified var to
	# true (i.e. Lori has visually
	# verified this person's identity and
	# they don't have to do anything
	# special on next child signin)
	####################################
	def verify
		self.verified = true
		self.save
	end
	
end
