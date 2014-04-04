class IncomePartial < ActiveRecord::Migration
  def change
	change_table :incomes do |t|
		t.decimal :amount_paid
	end
  end
end
