class Income < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	
	
	#############################################
	# Getter for the income.amount field. Returns
	# a currency-formatted version of the value.
	##############################################
	def amount
		ActionController::Base.helpers.number_to_currency(self[:amount])
	end
	
	
	#############################################
	# Secondary getter for the income.amount field. 
	# Returns a raw (decimal) version of the value.
	#############################################
	def amount_no_format
		self[:amount]
	end
	
	##
	#def date  
	# date.to_s(:db)  
	#end  
  
	#def date=(date)  
	#	self.date = Time.parse(date)
	#end
	#
end
