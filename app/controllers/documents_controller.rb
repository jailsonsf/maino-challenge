class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user

    if @document.save
      redirect_to(@document, notice: "Xml file uploaded.")
    else
      error_message = @document.errors[:xml_file].join(', ')
      redirect_to(new_document_path, alert: error_message)
    end
  end

  private

  def document_params
    params.require(:document).permit(:xml_file)
  end
end
