class Document < ApplicationRecord
  has_one(:report)
  belongs_to(:user)

  validates(:filename, presence: true)
  validate(:file_format)

  def file_format
    unless filename.end_with?('.xml')
      errors.add(:filename, I18n.t('activerecord.errors.models.document.attributes.file.wrong_type'))
    end
  end
end
