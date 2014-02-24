class CreateDocumentsTable < ActiveRecord::Migration
  def change
    create_table :documents_tables do |t|
    t.string :category
    t.string :title
    t.index :title
    t.string :path
    t.date :expiration
    end
  end
end
