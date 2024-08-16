require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  let(:user) { create(:user) }
  let(:document) { create(:document, user: user) }
  let(:report) { create(:report, document: document) }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    it "assigns @reports" do
      get :index
      expect(assigns(:reports)).to include(report)
    end

    it "filters reports by current user" do
      user = create(:user, email: 'test2@email.com')
      document002 = create(:document, user: user)
      report002 = create(:report, document: document002)

      get :index
      expect(assigns(:reports)).to include(report)
      expect(assigns(:reports)).not_to include(report002)
    end
  end

  describe "GET #show" do
    it "assigns the requested report to @report" do
      get :show, params: { id: report.id }
      expect(assigns(:report)).to eq(report)
    end
  end
end
