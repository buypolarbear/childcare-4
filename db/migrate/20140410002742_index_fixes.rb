class IndexFixes < ActiveRecord::Migration
  def change
  change_table :children do |t|
		t.index :id
		end
		
  change_table :children_parents do |t|
		t.index :id
		end
		
  change_table :events do |t|
		t.index :id
		end
		
  change_table :parents do |t|
		t.index :id
		end
		
  change_table :rates do |t|
		t.index :name
		end
		
  end
end
