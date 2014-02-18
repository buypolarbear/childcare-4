##############################################
# Contains helper methods for actions in various
# controllers, most relating to authenticating,
# authorizing, or maintaining the state of the
# application as it is navigated by the user.
#
# Note that helper methods are public and thus
# available to all controllers
##############################################
module SessionsHelper


	##############################################
	# Creates a remember_token (session key) for
	# the user trying to sign in, stores that token
	# in a browser cookie, stores an encrypted version
	# of that key in the user's database record,
	# and then sets the current user variable
	##############################################
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end
	
	
	##############################################
	# Is there a currently signed-in user??
	##############################################
	def signed_in?
		!current_user.nil?
	end
	
	
	#############################################
	# Assigns the passed user variable to the
	# current session's current_user variable;
	# this lets us do things like "if current_user.admin? ..."
	##############################################
	def current_user=(user)
		@current_user = user
	end
	
	
	#############################################
	# Returns the user that is signed in to the
	# current session
	##############################################
	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end
end