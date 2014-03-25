class CreateChildEvents < ActiveRecord::Migration
  def change
    create_table :child_events do |t|
		t.integer :kid_id
		t.datetime :start_time
		t.datetime :end_time
		t.index :kid_id
    end
  end
end
