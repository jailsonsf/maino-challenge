class Document < ApplicationRecord
  DEFAULT_ACCEPTED_CONTENT_TYPES =["application/xml", "text/xml"].freeze

  has_one_attached(:xml_file)
  has_one(:report)
  belongs_to(:user)

  validates(:xml_file, presence: true)
  validates(:xml_file, content_type: DEFAULT_ACCEPTED_CONTENT_TYPES)
end
