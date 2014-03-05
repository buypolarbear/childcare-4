class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
	@user = current_user
  end
  
  #############################################
  # Attempts to store a new user with the passed
  # attributes in the database; goes to new user's
  # profile page on success, and to "new" view on
  # failure
  ##############################################
  def create
    @expense = Expense.new(expense_params)
    if @expense.save
	  flash[:success] = "Expense record created"
      redirect_to @expense
    else
      render 'new'
    end
  end
  
  def show
    @expense = Expense.find(params[:id])
  end
  
  def index
    @expenses = Expense.all
  end

  #############################################
  # 
  ##############################################
  def edit
	# no longer needed since the before_filter actions already
	# initialize this variable
    #@user = User.find(params[:id])
	@expense = Expense.find(params[:id])
  end

  def update
	# no longer needed since the before_filter actions already
	# initialize this variable
    # @user = User.find(params[:id])
	@expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      flash[:success] = "Profile updated"
      redirect_to @expense
    else
      render 'edit'
    end
  end

  def destroy
  end
  
  private

    def expense_params
      params.require(:expense).permit(:fname, :lname, :email, :password,
                                   :password_confirmation, :phone_home,
								   :phone_cell, :phone_work, :ssn, :street_addr,
								   :city, :state, :zip)
    end
end
