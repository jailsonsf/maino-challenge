class Report < ApplicationRecord
  has_one(:emitente)
  has_one(:destinatario)
  has_many(:products)
  belongs_to(:document)

  validates(:serie, :n_nf, :dh_emi, presence: true)

  def self.ransackable_attributes(auth_object = nil)
    super + %w[n_nf]
  end
end
