class PagesController < ApplicationController
  include ApplicationHelper

  before_action :require_login, :set_documents

  def home; end

  private

  def set_documents
    @documents = Document.where(user_id: current_user.id)
  end
end
