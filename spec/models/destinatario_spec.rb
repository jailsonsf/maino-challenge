require 'rails_helper'

RSpec.describe Destinatario, type: :model do
  context 'when destinatario is valid' do
    it 'when document_id is not valid' do
      destinatario = build(:destinatario, cnpj: '', name: '', address: '')
      expect(destinatario).to_not be_valid
      expect(destinatario.errors.added?(:cnpj, :blank))
      expect(destinatario.errors.added?(:name, :blank))
      expect(destinatario.errors.added?(:address, :blank))
    end
  end

  context 'when destinatario is not valid' do
    let(:user) { create(:user) }
    let(:document) { create(:document, user: user) }
    let(:report) { create(:report, document: document) }

    it 'when destinatario is valid' do
      destinatario = create(:destinatario, report: report)
      expect(destinatario).to be_valid
    end
  end
end
