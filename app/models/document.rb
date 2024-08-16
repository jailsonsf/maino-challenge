class Document < ApplicationRecord
  has_one(:report)
  belongs_to(:user)
end
