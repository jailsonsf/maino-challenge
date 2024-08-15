class Document < ApplicationRecord
  has_one_attached(:xml_file)
  has_one(:report)
  belongs_to(:user)

  validates(:xml_file, presence: true)
  validate(:correct_xml_file_type)

  private

  def correct_xml_file_type
    if xml_file.attached? && !(xml_file.content_type == "text/xml")
      errors.add(:xml_file, I18n.t('activerecord.errors.models.document.attributes.xml_file.wrong_type'))
    end
  end
end
