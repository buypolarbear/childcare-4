class Child < ActiveRecord::Base
	has_and_belongs_to_many :parents
	has_many :child_events
	accepts_nested_attributes_for :parents, allow_destroy: true
	
	belongs_to :rate
	
	####################################
	# Returns the first,
	# middle, and last names of the
	# child concatenated into a friendly
	# string
	####################################
	def full_name
		"#{fname} #{lname}"
	end
	
	
	#############################################
	# Decides if a child is in care right now
	# based on whether the child_event with the
	# most recent start_time has a corresponding
	# end_time (i.e. whether the last event is
	# still running/incomplete)
	##############################################
	def in_care?
		last_child_event = self.child_events.order('start_time DESC').first
		
		if last_child_event.end_time == nil
			return true
		end
		
		return false
		
	end
end