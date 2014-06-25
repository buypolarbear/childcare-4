class AddInvoice < ActiveRecord::Migration
  def change
	create_table :invoices do |t|
		t.datetime	:start_date
		t.datetime	:end_date
		t.integer	:parent_id
		t.boolean	:paid
		t.decimal	:correction_amount
				
		t.timestamps
    end
	
	create_table :invoice_incomes do |t|
		t.integer	:invoice_id
		t.integer	:income_id
				
		t.timestamps
    end
	
	drop_table :calenders
	drop_table :income_payments	
  end
end
