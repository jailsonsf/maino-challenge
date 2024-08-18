require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "POST #create" do
    context 'when it has valid parameters' do
      it 'creates the document with correct attributes'do
        document_params = {
          xml_file: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/CASE_001.xml'))
        }

        expect {
          post :create, params: { document: document_params }
        }.to change(Document, :count).by(1)

        document = Document.last
        expect(document.filename).to eq('CASE_001.xml')
      end
    end

    context 'when it has not valid parameters' do
      it 'creates the document with correct attributes'do
        document_params = {
          xml_file: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/CASE_002.yml'))
        }

        post :create, params: { document: document_params }

        expect(response).to redirect_to(new_document_path)
        expect(flash[:alert]).to eq(I18n.t('activerecord.errors.models.document.attributes.file.wrong_type'))
      end
    end
  end
end
