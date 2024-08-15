class Emitente < ApplicationRecord
  belongs_to(:report)

  validates(:cnpj, :name, :name_fant, :address, :fone, presence: true)
end
