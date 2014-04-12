class CreateDocumentsTable < ActiveRecord::Migration
  def change
    create_table :documents do |t|
    t.string :category
    t.string :title
    t.index :title
    t.string :path
    t.date :expiration
	t.belongs_to :user
    end
  end
end
