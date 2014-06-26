class Invoice < ActiveRecord::Base
	belongs_to :parent
	has_and_belongs_to_many :incomes
	
	require 'date'
	
	
	#############################################
	# Getter for the income.amount field. Returns
	# a currency-formatted version of the value.
	##############################################
	def amount
		ActionController::Base.helpers.number_to_currency(self[:amount])
	end
	
	
	#############################################
	# Getter for the income.amount field. Returns
	# a currency-formatted version of the value.
	##############################################
	def total_amount
		ActionController::Base.helpers.number_to_currency( (self[:amount] || 0) + (self[:correction_amount] || 0) )
	end
	
	#############################################
	# Getter for the income.amount field. Returns
	# a currency-formatted version of the value.
	##############################################
	def total_amount_raw
		(self[:amount] || 0) + (self[:correction_amount] || 0)
	end
	
	
	#############################################
	# Secondary getter for the income.amount field.
	# Returns a raw (decimal) version of the value.
	#############################################
	def amount_raw
		self[:amount]
	end
	
	
	#############################################
	# Getter for the income.amount field. Returns
	# a currency-formatted version of the value.
	##############################################
	def correction_amount
		ActionController::Base.helpers.number_to_currency(self[:correction_amount])
	end
	
	
	#############################################
	# Secondary getter for the income.amount field.
	# Returns a raw (decimal) version of the value.
	#############################################
	def correction_amount_raw
		self[:correction_amount]
	end
	
	def start_date( *format)
        self[:start_date].strftime(format.first || "%m/%d/%Y")
    end
	
	def end_date( *format)
        self[:end_date].strftime(format.first || "%m/%d/%Y")
    end
	
	def end_date_raw
	 self[:end_date]
	end
	
	def start_date_raw
	 self[:start_date]
	end

	def start_date=(date)  
		self[:start_date] = Date.strptime(date, "%m/%d/%Y")
	end
	
	def end_date=(date)  
		self[:end_date] = Date.strptime(date, "%m/%d/%Y")
	end
end