require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'when product is valid' do
    it 'when document_id is not valid' do
      product = build(:product, name_prod: '', ncm: '', cfop: '', u_com: '', q_com: '', value_un_com: '')
      expect(product).to_not be_valid
      expect(product.errors.added?(:name_prod, :blank))
      expect(product.errors.added?(:ncm, :blank))
      expect(product.errors.added?(:cfop, :blank))
      expect(product.errors.added?(:u_com, :blank))
      expect(product.errors.added?(:q_com, :blank))
      expect(product.errors.added?(:value_un_com, :blank))
    end
  end

  context 'when product is not valid' do
    let(:user) { create(:user) }
    let(:document) { create(:document, user: user) }
    let(:report) { create(:report, document: document) }

    it 'when product is valid' do
      product = create(:product, report: report)
      expect(product).to be_valid
    end
  end
end
