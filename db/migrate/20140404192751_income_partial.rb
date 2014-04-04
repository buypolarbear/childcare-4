class IncomePartial < ActiveRecord::Migration
  def change
	change_table :incomes do |t|
		t.decimal :amount_paid
		t.datetime :start_date
		t.datetime :end_date
	end
  end
end
