class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name_prod
      t.string :ncm
      t.string :cfop
      t.string :u_com
      t.decimal :q_com
      t.decimal :value_un_com
      t.decimal :value_icms
      t.decimal :value_ipi
      t.decimal :value_pis
      t.decimal :value_cofins
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
