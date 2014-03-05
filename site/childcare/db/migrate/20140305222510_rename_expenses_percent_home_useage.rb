class RenameExpensesPercentHomeUseage < ActiveRecord::Migration
	def change
		remove_column :expenses, :percent_home_useage
		add_column :expenses, :percent_home_usage, :decimal
	end
end
