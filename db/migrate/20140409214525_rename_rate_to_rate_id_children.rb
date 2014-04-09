class RenameRateToRateIdChildren < ActiveRecord::Migration
  def change
	change_column :children, :rate, :integer
	rename_column :children, :rate, :rate_id
  end
end
