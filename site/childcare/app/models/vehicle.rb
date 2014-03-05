class Vehicle < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	
	def full_description
		"#{year} #{make} #{model}"
	end
end
