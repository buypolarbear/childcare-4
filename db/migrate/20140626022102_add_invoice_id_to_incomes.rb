class AddInvoiceIdToIncomes < ActiveRecord::Migration
  def change
	add_column :incomes, :invoice_id, :integer
  end
end
