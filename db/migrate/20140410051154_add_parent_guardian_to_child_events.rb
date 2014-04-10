class AddParentGuardianToChildEvents < ActiveRecord::Migration
  def change
	add_column :child_events, :parent_id, :integer
  end
end
