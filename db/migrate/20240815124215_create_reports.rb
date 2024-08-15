class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :serie
      t.string :n_nf
      t.datetime :dh_emi
      t.decimal :products_total_value
      t.decimal :icms_total
      t.decimal :ipi_total
      t.decimal :pis_total
      t.decimal :cofins_total
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
