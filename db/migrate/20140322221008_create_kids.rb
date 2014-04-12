class CreateKids < ActiveRecord::Migration
  def change
    create_table :children do |t|
		t.string :fname
		t.string :lname
		t.integer :rate_id
		
		t.timestamps
    end
  end
end
