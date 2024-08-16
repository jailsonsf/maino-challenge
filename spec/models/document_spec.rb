require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:user) { create(:user) }

  it 'document is valid' do
    document = create(:document, user: user)
    expect(document).to be_valid
  end
end
