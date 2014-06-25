class Income < ActiveRecord::Base
	has_and_belongs_to_many :invoices
	
	require 'date'
	
	
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
	def amount_raw
		self[:amount]
	end
	
	def date( *format)
        self[:date].strftime(format.first || "%m/%d/%Y")
    end
	
	def date_raw
	 self[:date]
	end
  
	def date=(date)  
		self[:date] = Date.strptime(date, "%m/%d/%Y")
	end
	
end
