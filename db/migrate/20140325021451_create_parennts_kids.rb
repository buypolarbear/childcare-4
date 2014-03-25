class CreateParenntsKids < ActiveRecord::Migration
  def change
    create_table :parennts_kids do |t|
		t.integer :kid_id
		t.integer :parent_id
    end
  end
end
