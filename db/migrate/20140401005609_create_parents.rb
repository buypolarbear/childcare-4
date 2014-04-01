class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
		t.string :email
		t.string :fname
		t.string :lname
		t.string :phone_home
		t.string :phone_cell
		t.string :phone_work
		t.string :street_addr
		t.string :city
		t.string :state
		t.integer :zip
    end
  end
end
