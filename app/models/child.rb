class Child < ActiveRecord::Base
	has_and_belongs_to_many :parents
	has_many :child_events
	has_many :events
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
	# Get the child_event with the
	# most recent start_time
	##############################################
	# def current_event
		# @last_child_event = nil
	
		# # if there is an event to return
		# if !self.child_events.nil?
			# @last_child_event = self.child_events.order('start_time DESC').first
		# end
	# end
	
	
	#############################################
	# Get the child_event with the
	# most recent start_time
	##############################################
	# def current_event=( event )
		# if there is an event to return
		# write_attribute(self.child_events.order('start_time DESC').first, event)
	# end
	
	
	#############################################
	# Decides if a child is in care right now
	# based on whether the child_event with the
	# most recent start_time has a corresponding
	# end_time (i.e. whether the last event is
	# still running/incomplete)
	##############################################
	def in_care?
		#last_child_event = self.current_event
		
		#if last_child_event && last_child_event.end_time == nil
		#	return true
		#end
		
		#return false
		
		if current_event_id.nil?
			return false
		end
		
		return true
	end
	
	
	#############################################
	# Returns the total amount that should be
	# charged for the scheduled time in-care
	# between the passed start and end dates
	##############################################
	def bill_between(start_time, end_time = Time.now)
		
		# calculate hours scheduled during this time period
		hours_scheduled = hours_scheduled_between(start_time, end_time)
		
		# retrieve this child's current billing rate
		rate = Rate.find(self.rate_id)
		
		# calculate the 
		hours_scheduled * rate.rate_per_unit
	end
	
	
	#############################################
	# Returns the number of hours this child is
	# scheduled to be in care between the passed
	# start and end dates; if no end date is
	# passed, the method will calculate between
	# the start date and the present
	##############################################
	def hours_scheduled_between(start_time, end_time = Time.now)
		# find the events that fall in the given time frame
		events_between = self.events.between(start_time, end_time)
		
		duration = 0
		
		# add up the durations of each event
		events_between.each do | event |
			duration += event.duration
		end
		
		# convert to hours (from seconds) and return
		return duration/3600.0
	end
	
	
	#############################################
	# NOT USED CURRENTLY;
	# Creates a new child_event (places this child
	# in care)
	##############################################
	def arrive
		if self.in_care?
			return false
		end
		
		self.child_events.build(start_time: Time.now, parent_id: params[:parent_guardian_id])
	end
	
	
	
	#############################################
	# NOT USED CURRENTLY;
	# Finds the child_event with the most recent
	# start_time (for this particular child)
	# and sets its end_time
	##############################################
	def depart( parent_guardian_id )
		if !self.in_care?
			return false
		end
		
		event = self.child_events.order('start_time DESC').first
		
		event.end_time = Time.now
		event.parent_id = parent_guardian_id
	end	
end