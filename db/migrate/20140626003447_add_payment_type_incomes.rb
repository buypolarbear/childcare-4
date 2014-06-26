class AddPaymentTypeIncomes < ActiveRecord::Migration
  def change
	add_column :incomes, :tender_type, :string
	add_column :incomes, :check_number, :string
  end
end
