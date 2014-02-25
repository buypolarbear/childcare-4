class ChangeTypeColNameMultipleTables < ActiveRecord::Migration
  def up
		remove_column :incomes, :type
		add_column :incomes, :income_type, :string
		
		remove_column :users, :type
		add_column :users, :user_type, :string
	end
	
	def down		
		remove_column :incomes, :income_type
		
		remove_column :users, :user_type
	end
end
