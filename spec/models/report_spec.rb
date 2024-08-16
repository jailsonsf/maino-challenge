require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'when report is valid' do
    it 'when document_id is not valid' do
      report = build(:report, serie: '', n_nf: '', dh_emi: '')
      expect(report).to_not be_valid
      expect(report.errors.added?(:serie, :blank))
      expect(report.errors.added?(:n_nf, :blank))
      expect(report.errors.added?(:dh_emi, :blank))
    end
  end

  context 'when report is not valid' do
    let(:user) { create(:user) }
    let(:document) { create(:document, user: user) }

    it 'when report is valid' do
      report = create(:report, document: document)
      expect(report).to be_valid
    end
  end
end
