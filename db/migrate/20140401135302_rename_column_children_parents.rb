class RenameColumnChildrenParents < ActiveRecord::Migration
  def change
	rename_column :children_parents, :kid_id, :child_id
  end
end
