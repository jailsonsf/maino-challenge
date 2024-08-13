class Document < ApplicationRecord
  has_one_attached :xml_file
  belongs_to :user
end
