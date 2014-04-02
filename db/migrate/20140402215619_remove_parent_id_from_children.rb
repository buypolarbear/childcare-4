class RemoveParentIdFromChildren < ActiveRecord::Migration
  def change
	remove_column :children, :parent_id
  end
end
