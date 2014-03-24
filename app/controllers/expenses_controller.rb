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
	@user = @expense.user
  end
  
  def index
    @expenses = Expense.all
  end

  #############################################
  # 
  ##############################################
  def edit
	@expense = Expense.find(params[:id])
	@user = @expense.user
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
	Expense.find(params[:id]).destroy
	redirect_to expenses_url
  end
  
  private

    def expense_params
      params.require(:expense).permit(:description, :amount, :percent_home_usage,
									:depreciation_rate, :expense_type, :vehicle_id,
									:vehicle_mileage, :date, :user_id)
    end
end
