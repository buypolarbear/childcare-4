class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :mname, :string
    add_column :users, :ssn, :integer
    add_column :users, :phone_home, :integer
    add_column :users, :phone_cell, :integer
    add_column :users, :phone_work, :integer
    add_column :users, :street_addr, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
  end
end
