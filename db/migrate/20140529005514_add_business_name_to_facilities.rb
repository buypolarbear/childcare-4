class AddBusinessNameToFacilities < ActiveRecord::Migration
  def change
	add_column :facilities, :business_name, :string
  end
end
