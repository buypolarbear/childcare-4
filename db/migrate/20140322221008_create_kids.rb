class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
		t.string :fname
		t.string :lname
		
		t.timestamps
    end
  end
end
