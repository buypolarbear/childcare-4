class Income < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	
	
	##
	#def date  
	# date.to_s(:db)  
	#end  
  
	#def date=(date)  
	#	self.date = Time.parse(date)
	#end
	#
end
