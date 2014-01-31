class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.decimal :sq_foot_total
      t.decimal :sq_foot_used
      t.decimal :time_used
      t.decimal :depreciation_rate

      t.timestamps
    end
  end
end
