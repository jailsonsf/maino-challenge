class Product < ApplicationRecord
  belongs_to(:report)

  validates(:name_prod, :u_com, :q_com, :value_un_com, presence: true)
end
