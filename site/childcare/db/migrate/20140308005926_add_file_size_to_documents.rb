class AddFileSizeToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :file_size, :integer
  end
end
