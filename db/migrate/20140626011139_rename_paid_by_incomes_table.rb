class RenamePaidByIncomesTable < ActiveRecord::Migration
  def change
	rename_column :incomes, :paid_by, :parent_id
  end
end
