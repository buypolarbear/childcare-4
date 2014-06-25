class SessionsController < ApplicationController
  def new
  end
  
  
  #############################################
  # Attempts to sign in a user by checking the
  # database for a email/hashed password pair that
  # corresponds with the one passed in.
  ##############################################
  def create
  
	user = User.find_by(email: params[:session][:login_param].downcase)

	if user && user.authenticate(params[:session][:password])
		sign_in user
		
		if user.admin?
			redirect_to signin_admin_session_type_path
		else
			redirect_back_or user
		end
    else
		flash[:error] = "Invalid email address or password"
		redirect_to root_url
    end
  end

  #############################################
  # Signs out the current user
  ##############################################
  def destroy
	sign_out
	redirect_to root_url
  end
  
  
  #############################################
  # Creates a work session for the current user
  ##############################################
  def admin_session_type
	
  end
  
  #############################################
  # Checks the passed string to see if it is a
  # well-formed email address
  ##############################################
  def is_email(input)
	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	# check to see if the input is a valid email address
	if input =~ valid_email_regex
		return true
	else
		return false # it must be a phone number
	end
  end
end
