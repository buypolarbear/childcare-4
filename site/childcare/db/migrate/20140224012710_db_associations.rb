class DbAssociations < ActiveRecord::Migration
  def change
  change_table :expenses do |t|
		t.belongs_to :users
		end
	change_table :facilities do |t|
		t.belongs_to :users
		end
	change_table :incomes do |t|
		t.belongs_to :users
		end
	change_table :vehicles do |t|
		t.belongs_to :users
		end
	change_table :documents do |t|
		t.belongs_to :users
		end
  end
end
