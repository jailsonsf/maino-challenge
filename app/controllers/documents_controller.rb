class DocumentsController < ApplicationController
  include ApplicationHelper

  before_action :require_login

  def new
    @document = Document.new
  end

  def create
    @document = Document.new
    @document.user = current_user
    @document.filename = document_params[:xml_file].original_filename

    if @document.save
      xml_data = document_params[:xml_file].tempfile.read
      ProcessXmlFileJob.perform_later(xml_data, @document.id)
      redirect_to(new_document_path, notice: I18n.t('documents.messages.document_created'))
    else
      error_message = I18n.t('documents.messages.create_fail')
      if @document.errors.messages[:filename].present?
        error_message = @document.errors.messages[:filename].join
      end

      redirect_to(new_document_path, alert: error_message)
    end
  end

  private

  def document_params
    params.require(:document).permit(:xml_file)
  end
end
