class Document < ApplicationRecord
  has_one(:report)
  belongs_to(:user)

  validates(:filename, presence: true)
end
