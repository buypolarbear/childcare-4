class AddFieldsToFacility < ActiveRecord::Migration
  def change
	add_column :facilities, :business_address_one, :string
	add_column :facilities, :business_address_two, :string
	add_column :facilities, :business_city, :string
	add_column :facilities, :business_state, :string
	add_column :facilities, :business_zip, :string
	add_column :facilities, :business_phone, :string
	add_column :facilities, :business_email, :string
	add_column :facilities, :exclusive_use_room, :boolean
  end
end