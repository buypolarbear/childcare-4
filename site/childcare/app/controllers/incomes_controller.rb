class IncomesController < ApplicationController
  def new
	@income = Income.new
  end

  def create
  end

  def edit
  end

  def update
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
	end
end
