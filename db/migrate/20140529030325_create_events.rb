class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.boolean :allDay
      t.datetime :start
      t.datetime :end
      t.string :url
      t.string :color
      t.string :textColor
      t.integer :child_id
      t.string :type

      t.timestamps
    end
  end
end

