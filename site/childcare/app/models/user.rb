class User < ActiveRecord::Base

	# before saving, convert the user-input email to all lowercase
	before_save { self.email = email.downcase }
	
	validates :fname, presence: true, length: { maximum: 25 }
	validates :lname, presence: true, length: { maximum: 25 }
	validates :lname, length: { maximum: 25 }
	
	# user a regular expression to confirm that the email address is in a recognizable form
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }
	
	
	phone_number_length = 10	# this is the length of all phone numbers
	validates :phone_home, length: { is: phone_number_length },
		numericality: { only_integer: true }
	validates :phone_work, length: { is: phone_number_length },
		numericality: { only_integer: true }
	validates :phone_cell, length: { is: phone_number_length },
		numericality: { only_integer: true }
	validates :state, length: { is: 2 }
	validates :zip, length: { is: 5 }, numericality: { only_integer: true }
		
	has_secure_password
	validates :password, length: { minimum: 6 }
	validates :ssn, presence: true, length: { is: 9 }, uniqueness: { case_sensitive: false },
		numericality: { only_integer: true }
end
