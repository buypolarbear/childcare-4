class ChangeVerifiedTypeParents < ActiveRecord::Migration
  def change
	remove_column :parents, :verified
	add_column :parents, :verified, :boolean
  end
end
