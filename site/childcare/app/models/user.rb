class User < ActiveRecord::Base
	before_create :create_remember_token
	
	has_secure_password
	
	has_many :vehicles
	has_many :incomes
	has_many :expenses
	has_one :facility
	
	# before saving, convert the user-input email to all lowercase
	before_save { self.email = email.downcase }
	
	validates :fname, presence: true, length: { maximum: 25 }
	validates :lname, presence: true, length: { maximum: 25 }
	validates :lname, length: { maximum: 25 }
	
	# user a regular expression to confirm that the email address is in a recognizable form
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }
		
	validates :password, length: { minimum: 6 }, :on => :create
	
	
	
	
	####################################
	# Returns the first,
	# middle, and last names of the
	# user concatenated into a friendly
	# string
	####################################
	def full_name
		"#{fname} #{lname}"
	end
	
	
	####################################
	# Returns true if the current user
	# has administrator permissions; false
	# otherwise
	####################################
	def admin?
		self.user_type == "admin"
	end
	
	def employee?
		self.user_type == "employee"
	end
	
	def parent?
		self.user_type == "parent"
	end
	
	
	########################
	# BEGIN PRIVATE METHODS
	########################
  private

	####################################
	# Generates a key that gets stored
	# in a cookie on the user's computer;
	# this is referenced with an encrypted
	# version of the same key in the database
	# to verify the user's identity and log
	# the user on automatically.
	####################################
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
	
	
	####################################
	# Generates a key that gets stored
	# in a cookie on the user's computer;
	# this is referenced with an encrypted
	# version of the same key in the database
	# to verify the user's identity and log
	# the user on automatically.
	####################################
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	
	####################################
	# Encrypts and returns the passed
	# remember_token 
	####################################
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
end
