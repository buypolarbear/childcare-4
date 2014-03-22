class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :description
      t.boolean :notify

      t.timestamps
    end
  end
end
