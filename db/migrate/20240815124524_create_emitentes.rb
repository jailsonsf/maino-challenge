class CreateEmitentes < ActiveRecord::Migration[7.1]
  def change
    create_table :emitentes do |t|
      t.string :cnpj
      t.string :name
      t.string :name_fant
      t.string :address
      t.string :fone
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
