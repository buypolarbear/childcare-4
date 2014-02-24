class User < ActiveRecord::Base
	before_create :create_remember_token
	
	has_many :vehicles
	has_many :incomes
	has_many :expenses
	
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
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
