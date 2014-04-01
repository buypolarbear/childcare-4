class UpdateChildren < ActiveRecord::Migration
  def change
	add_column :children, :parent_id, :integer
	add_column :children, :rate, :decimal
	remove_column :children, :trusted_one
	remove_column :children, :trusted_two
	remove_column :children, :trusted_three
  end
end
