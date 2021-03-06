#############################################
# Class: IncomesController
# 
# Purpose: Provide interface between the model
# and views for Income records. Record instances
# of income
##############################################
class IncomesController < ApplicationController


  #############################################
  # Instantiates a new Income object to be 
  # populated by the new.html.erb form submission
  ##############################################
  def new
	@income = Income.new
  end

  
  #############################################
  # Called upon submission of the new Income form
  # Attempts to save the income record to the db
  ##############################################
  def create
	@income = Income.new(income_params)
    if @income.save
	  flash[:success] = "Record was created successfully"
      redirect_to @income
    else
      render 'new'
    end
  end

  
  #############################################
  # Retrieves the income record with the passed
  # id in order to populate the Income edit view
  ##############################################
  def edit
	@income = Income.find(params[:id])
  end

  
  #############################################
  # Called upon submission of the edit income
  # form. Attempts to save the changed income
  # record to the database
  ##############################################
  def update
	@income = Income.find(params[:id])
    if @income.update_attributes(income_params)
      flash[:success] = "Changes saved"
      redirect_to @income
    else
      render 'edit'
    end
  end

  
  #############################################
  # Populates the variables necessary for
  # displaying a single Income record view
  ##############################################
  def show
	@income = Income.find(params[:id])
	@parent = Parent.find(@income.parent_id) unless @income.parent_id.nil?
  end

  
  #############################################
  # Populates the variables necessary for
  # displaying a list of all income records
  ##############################################
  def index
	@incomes = Income.all
  end

  
  #############################################
  # Populates the variables necessary for
  # displaying a list of all income records
  ##############################################
  def toggle_paid
	@income = Income.find(params[:id])
    @income.paid = :paid
	@income.save!
  end
  
  
  #############################################
  # Attempts to remove the income record with
  # the passed id from the database
  ##############################################
  def destroy
	Income.find(params[:id]).destroy
	redirect_to incomes_url
  end

  private
  
	#############################################
	# Enforces strong parameters in the income
	# model. An update/creation requires at least
	# an income hash, which is only permitted to
	# contain a description, income_type, etc.
	##############################################
	def income_params
		params.require(:income).permit(:description, :category, :amount, :date, :parent_id, :tender_type, :check_number)
	end
end
