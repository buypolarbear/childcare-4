class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
		t.string :fname
		t.string :lname
		t.string :trusted_one
		t.string :trusted_two
		t.string :trusted_three
		
		t.timestamps
    end
  end
end
