class Parent < ActiveRecord::Base
	has_and_belongs_to_many :children
	has_many :invoices
	has_many :incomes
	
	
	####################################
	# Returns the first,
	# middle, and last names of the
	# parent concatenated into a friendly
	# string
	####################################
	def full_name
		"#{fname} #{lname}"
	end
	
	
	#############################################
	# Returns the total amount owed by this parent
	# for all of their children
	##############################################
	def bill_between(start_time, end_time = Time.now)
		
		bill_amount = 0
		
		# loop through children, adding their bill amounts to the total
		self.children.each do | child |
			bill_amount += child.bill_between(start_time, end_time)
		end
		
		return bill_amount
	
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
