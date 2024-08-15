class CreateDestinatarios < ActiveRecord::Migration[7.1]
  def change
    create_table :destinatarios do |t|
      t.string :cnpj
      t.string :name
      t.string :address
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
