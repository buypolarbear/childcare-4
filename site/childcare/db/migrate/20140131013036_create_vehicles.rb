class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :license
      t.decimal :depreciation_rate

      t.timestamps
    end
  end
end
