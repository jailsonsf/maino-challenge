require 'rails_helper'

RSpec.describe Emitente, type: :model do
  context 'when emitente is valid' do
    it 'when document_id is not valid' do
      emitente = build(:emitente, cnpj: '', name: '', name_fant: '', address: '', fone: '')
      expect(emitente).to_not be_valid
      expect(emitente.errors.added?(:cnpj, :blank))
      expect(emitente.errors.added?(:name, :blank))
      expect(emitente.errors.added?(:name_fant, :blank))
      expect(emitente.errors.added?(:address, :blank))
      expect(emitente.errors.added?(:fone, :blank))
    end
  end

  context 'when emitente is not valid' do
    let(:user) { create(:user) }
    let(:document) { create(:document, user: user) }
    let(:report) { create(:report, document: document) }

    it 'when emitente is valid' do
      emitente = create(:emitente, report: report)
      expect(emitente).to be_valid
    end
  end
end
