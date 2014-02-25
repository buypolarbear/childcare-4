class Income < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	
	def amount
		ActionController::Base.helpers.number_to_currency(self[:amount])
	end
	
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
