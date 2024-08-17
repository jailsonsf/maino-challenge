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
      redirect_to(new_document_path, notice: "Arquivo adicionado. Resultado será exibido em breve na página inicial.")
    else
      error_message = 'Falha ao criar documento.'
      redirect_to(new_document_path, alert: error_message)
    end
  end

  private

  def document_params
    params.require(:document).permit(:xml_file)
  end
end
