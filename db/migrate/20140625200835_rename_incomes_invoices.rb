class RenameIncomesInvoices < ActiveRecord::Migration
  def change
	remove_index :invoices_incomes, :name => "index_invoices_incomes_on_invoice_id"
	
	rename_table :invoices_incomes, :incomes_invoices
	
	add_index :incomes_invoices, :invoice_id	
  end
end
