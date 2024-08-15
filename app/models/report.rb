class Report < ApplicationRecord
  has_one(:emitente)
  has_one(:destinatario)
  has_many(:products)
  belongs_to(:document)

  validates(:serie, :n_nf, :dh_emi, presence: true)
end
