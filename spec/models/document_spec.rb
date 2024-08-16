require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:user) { create(:user) }

  it 'check xml file content type' do
    document = create(:document, user: user)
    expect(["application/xml","text/xml"]).to include(document.xml_file.content_type)
  end
end
