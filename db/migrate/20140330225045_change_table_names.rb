class ChangeTableNames < ActiveRecord::Migration
  def change
	rename_table :kids, :children
	rename_table :parennts_kids, :children_parents
  end
end
