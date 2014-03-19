class IndexVehicles < ActiveRecord::Migration
  def change
  change_table :vehicles do |t|
		t.index :license
		end
  end
end
