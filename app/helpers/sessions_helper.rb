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
	# Signs the user out
	##############################################
	def sign_out
		current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
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
	# this lets us do things like "if @current_user.admin? ..."
	##############################################
	def current_user=(user)
		@current_user = user
	end
	
	
	#############################################
	# Checks to make sure that the passed user is
	# the same one who is currently signed in;
	# this prevents users from editing other users'
	# information
	##############################################
	def current_user?(user)
		user == current_user
	end
	
	
	#############################################
	# Returns the user that is signed in to the
	# current session
	##############################################
	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end
	
	
	#############################################
	# Navigates the user's browser to either the
	# passed "default" page, or to the return_to
	# page that was stored in the user's session;
	# used to implement smart redirects after sign
	# in
	##############################################
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	
	#############################################
	# Stores the current url in the user's session's
	# return_to variable;
	# used to implement smart redirects after sign
	# in
	##############################################
	def store_location
		session[:return_to] = request.url if request.get?
	end
	
	
	#############################################
	# Verifies that the current site user is signed in
	##############################################
    def signed_in_user
	  store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
	
	#############################################
	# Checks to make sure that users can only edit
	# their own information
	#############################################
	def correct_user
      @user = User.find(params[:id])
      redirect_to root_url, notice: "You do not have permission to view or edit this information because it isn't yours." unless current_user?(@user)
    end
	
	
	#############################################
	# Checks to make sure the current user is an
	# administrator
	#############################################
	def admin_user
      redirect_to root_url, notice: "You do not have permission to view or edit this information." unless current_user.admin?
    end
end