class AddVerifiedToParents < ActiveRecord::Migration
  def change
	add_column :parents, :verified, :string
  end
end
