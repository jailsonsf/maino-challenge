class AddFileNameToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :filename, :string
  end
end
