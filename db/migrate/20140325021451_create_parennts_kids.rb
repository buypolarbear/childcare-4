class CreateParenntsKids < ActiveRecord::Migration
  def change
    create_table :children_parents do |t|
		t.integer :child_id
		t.integer :parent_id
    end
  end
end
