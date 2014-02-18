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

	has_secure_password
	validates :password, length: { minimum: 6 }
end
