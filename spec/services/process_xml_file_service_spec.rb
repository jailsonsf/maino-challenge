require 'rails_helper'

RSpec.describe ProcessXmlFileService, type: :service do
  let(:user) { create(:user) }
  let(:document) { create(:document, user: user) }
  let(:xml_data) { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/CASE_001.xml')).tempfile.read }
  
  describe '#call' do
    context 'call service with valid params' do
      let(:service) { ProcessXmlFileService.new(xml_data, document.id) }

      it 'extract xml data to Report' do
        expect {
          service.call
        }.to change(Report, :count).by(1)
      end
    end
  end
end
