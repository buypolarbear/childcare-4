class UpdateUsers < ActiveRecord::Migration
  def change
	add_column :users, :trusted_one, :string
	add_column :users, :trusted_two, :string
	add_column :users, :trusted_three, :string
  end
end
