class Destinatario < ApplicationRecord
  belongs_to(:report)

  validates(:cnpj, :name, :address, presence: true)
end
