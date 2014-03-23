class SessionsController < ApplicationController
  def new
  end
  
  
  #############################################
  # Attempts to sign in a user by checking the
  # database for a email/hashed password pair that
  # corresponds with the one passed in.
  ##############################################
  def create
	if is_email params[:session][:login_param]
		user = User.find_by(email: params[:session][:login_param].downcase)
	else
		user = User.find_by(phone_home: params[:session][:login_param])
	end
	
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash[:error] = 'Invalid email or phone and password combination'
      redirect_to root_url
    end
  end

  #############################################
  # 
  ##############################################
  def destroy
	sign_out
	redirect_to root_url
  end
  
  
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
