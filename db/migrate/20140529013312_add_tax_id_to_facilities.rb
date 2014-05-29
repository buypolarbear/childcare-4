class AddTaxIdToFacilities < ActiveRecord::Migration
  def change
	add_column :facilities, :tax_id, :string
  end
end
