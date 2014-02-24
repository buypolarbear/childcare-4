class AddUserIdtoTables < ActiveRecord::Migration
  def change
	change_table :expenses do |t|
		t.integer :user_id
	end
	
	
	change_table :facilities do |t|
		t.integer :user_id
	end
	
	
	change_table :incomes do |t|
		t.integer :user_id
	end
	
	
	change_table :vehicles do |t|
		t.integer :user_id
	end
	
	
	change_table :documents do |t|
		t.integer :user_id
	end
  end
end
