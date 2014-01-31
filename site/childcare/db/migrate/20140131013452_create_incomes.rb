class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :tpye
      t.decimal :amount
      t.datetime :date
      t.string :description

      t.timestamps
    end
  end
end
