class InvoicesController < ApplicationController
  #############################################
  # Instantiates a new Invoice object to be 
  # populated by the new.html.erb form submission
  ##############################################
  def new
	@invoice = Invoice.new
  end

  
  #############################################
  # Called upon submission of the new Invoice form
  # Attempts to save the invoice record to the db
  ##############################################
  def create
	@invoice = Invoice.new(invoice_params)
    if @invoice.save
	  flash[:success] = "Record was created successfully"
      redirect_to @invoice
    else
      render 'new'
    end
  end

  
  #############################################
  # Retrieves the invoice record with the passed
  # id in order to populate the Invoice edit view
  ##############################################
  def edit
	@invoice = Invoice.find(params[:id])
  end

  
  #############################################
  # Called upon submission of the edit invoice
  # form. Attempts to save the changed invoice
  # record to the database
  ##############################################
  def update
	@invoice = Invoice.find(params[:id])
    if @invoice.update_attributes(invoice_params)
      flash[:success] = "Changes saved"
      redirect_to @invoice
    else
      render 'edit'
    end
  end

  
  #############################################
  # Populates the variables necessary for
  # displaying a single Invoice record view
  ##############################################
  def show
	@invoice = Invoice.find(params[:id])
	@parent = Parent.find(@invoice.parent_id)
  end

  
  #############################################
  # Populates the variables necessary for
  # displaying a list of all invoice records
  ##############################################
  def index
	@invoices = Invoice.all
  end

  
  #############################################
  # Populates the variables necessary for
  # displaying a list of all invoice records
  ##############################################
  def toggle_paid
	@invoice = Invoice.find(params[:id])
    @invoice.paid = :paid
	@invoice.save!
  end
  
  
  #############################################
  # Attempts to remove the invoice record with
  # the passed id from the database
  ##############################################
  def destroy
	Invoice.find(params[:id]).destroy
	redirect_to invoices_url
  end

  private
  
	#############################################
	# Enforces strong parameters in the invoice
	# model. An update/creation requires at least
	# an invoice hash, which is only permitted to
	# contain a description, invoice_type, etc.
	##############################################
	def invoice_params
		params.require(:invoice).permit(:start_date, :end_date, :amount, :correction_amount, :parent_id, :paid)
	end
end
