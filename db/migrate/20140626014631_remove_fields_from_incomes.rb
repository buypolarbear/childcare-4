class RemoveFieldsFromIncomes < ActiveRecord::Migration
  def change
	remove_column :incomes, :start_date
	remove_column :incomes, :end_date	
  end
end
