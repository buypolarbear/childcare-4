class CreateIncomePayments < ActiveRecord::Migration
  def change
    create_table :income_payments do |t|
    t.datetime :date_paid
    t.decimal :amount_paid
    t.integer :parent_id
    t.integer :income_id
    t.string :type
    t.index :id
    end
  end
end
