class AddCurrentEventToMultipleTables < ActiveRecord::Migration
  def change
	add_column :children, :current_event_id, :integer
	add_column :users, :current_event_id, :integer
	add_column :parents, :current_event_id, :integer
  end
end
