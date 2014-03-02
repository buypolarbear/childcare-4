class Income < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	
<<<<<<< HEAD
=======
	require 'date'
	
	
	#############################################
	# Getter for the income.amount field. Returns
	# a currency-formatted version of the value.
	##############################################
>>>>>>> origin/income_reporting
	def amount
		ActionController::Base.helpers.number_to_currency(self[:amount])
	end
	
<<<<<<< HEAD
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
=======
	
	#############################################
	# Secondary getter for the income.amount field. 
	# Returns a raw (decimal) version of the value.
	#############################################
	def amount_raw
		self[:amount]
	end
	
	
	#def date  
	# self[:date].strftime("%m/%d/%Y")
	#end
	
	def date( *format)
        self[:date].strftime(format.first || "%m/%d/%Y")
    end
	
	def date_raw
	 self[:date]
	end
  
	def date=(date)  
		self[:date] = Date.parse(date)
	end
	
>>>>>>> origin/income_reporting
end
