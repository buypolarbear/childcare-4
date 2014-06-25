class AddIndexToIncomesInvoices < ActiveRecord::Migration
  def change
	rename_table :invoice_incomes, :invoices_incomes
	
	add_index :invoices_incomes, :invoice_id
	
  end
end
