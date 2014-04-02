class CreateRatesTable < ActiveRecord::Migration
  def change
    create_table :rates do |t|
		t.string :name
		t.decimal :rate_per_unit
		t.integer :unit
		
		t.timestamps
    end
  end
end
