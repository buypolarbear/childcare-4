class ChangeTypoInIncomes < ActiveRecord::Migration
  def change
     remove_column :incomes, :tpye
	 add_column :incomes, :type, :string
  end
end
