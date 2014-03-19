class IndexSetup < ActiveRecord::Migration
  def change
	change_table :expenses do |t|
		t.index :date
		end
	change_table :facilities do |t|
		t.index :name
		end
	change_table :incomes do |t|
		t.index :date
		end
	change_table :vehicles do |t|
		t.index :license
		end
  end
end
