class ChangePhoneNumberTypeUsers < ActiveRecord::Migration
  def change
	remove_column :users, :phone_home
	add_column :users, :phone_home, :string
	
	remove_column :users, :phone_cell
	add_column :users, :phone_cell, :string
	
	remove_column :users, :phone_work
	add_column :users, :phone_work, :string
	
	remove_column :users, :ssn
	add_column :users, :ssn, :string
  end
end
