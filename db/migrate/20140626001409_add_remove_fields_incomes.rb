class AddRemoveFieldsIncomes < ActiveRecord::Migration
  def change
	remove_column :incomes, :owed_by
	remove_column :incomes, :user_id
	remove_column :incomes, :income_type
	remove_column :incomes, :paid
		
	add_column :incomes, :paid_by, :integer
	add_column :incomes, :category, :string
  end
end
