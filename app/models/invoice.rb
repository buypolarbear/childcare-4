class Invoice < ActiveRecord::Base
	belongs_to :parent
	has_and_belongs_to_many :incomes
end