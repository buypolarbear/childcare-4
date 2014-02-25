class IncomesController < ApplicationController
  def new
	@income = Income.new
  end

  def create
	@income = Income.new(income_params)
    if @income.save
	  flash[:success] = "Record was created successfully"
      redirect_to @income
    else
      render 'new'
    end
  end

  def edit
	@income = Income.find(params[:id])
  end

  def update
	@income = Income.find(params[:id])
    if @income.update_attributes(income_params)
      flash[:success] = "Changes saved"
      redirect_to @income
    else
      render 'edit'
    end
  end

  def show
	@income = Income.find(params[:id])
  end

  def index
  end

  def destroy
  end

  private
  
	def income_params
		params.require(:income).permit(:description, :income_type, :amount, :date, :user_id)
	end
end
