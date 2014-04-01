class EditChildEvents < ActiveRecord::Migration
  def change
	add_column :child_events, :actual_start, :datetime
	add_column :child_events, :actual_end, :datetime
	rename_column :child_events, :kid_id, :child_id
  end
end
