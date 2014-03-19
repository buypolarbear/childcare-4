class IncomeEdits < ActiveRecord::Migration
  def change
  change_table :incomes do |t|
		t.boolean :paid
		t.string :owed_by
		end
  end
end
