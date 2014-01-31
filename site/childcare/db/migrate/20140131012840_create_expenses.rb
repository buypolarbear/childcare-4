class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :type
      t.decimal :amount
      t.integer :percent_home_useage
      t.integer :vehicle_id
      t.decimal :vehicle_mileage
      t.datetime :date
      t.string :description
      t.decimal :depreciation_rate

      t.timestamps
    end
  end
end
