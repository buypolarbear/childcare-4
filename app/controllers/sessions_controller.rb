class SessionsController < ApplicationController
  def new
  end
  
  
  #############################################
  # Attempts to sign in a user by checking the
  # database for a email/hashed password pair that
  # corresponds with the one passed in.
  ##############################################
  def create
	
	name_array = params[:session][:login_param].split
	
	# get all the users with this full name
	users = User.where("users.fname = ? AND users.lname = ?", name_array[0], name_array[1])
  
    # use this code to log in with either an email address or a home phone number
	##if !user && is_email params[:session][:login_param]
	#	user = User.find_by(email: params[:session][:login_param].downcase)
	#else
	#	user = User.find_by(phone_home: params[:session][:login_param])
	#end
	#
	
	# if there is at least 1 user in the database with the passed name
    if users.count > 0
	
		# loop through all users with the passed name and try logging them in with the passed password
		users.each do |user|
			if user.authenticate(params[:session][:password])
				sign_in user
				redirect_back_or user
			end
		end		
		
    else
		flash[:error] = 'There is no user with the name #{params[:session][:login_param]}'
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
