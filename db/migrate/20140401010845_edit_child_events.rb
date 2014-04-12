class EditChildEvents < ActiveRecord::Migration
  def change
	add_column :child_events, :actual_start, :datetime
	add_column :child_events, :actual_end, :datetime
  end
end
