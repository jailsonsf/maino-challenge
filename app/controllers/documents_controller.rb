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
      render :new
    end
  end

  private

  def document_params
    params.require(:document).permit(:xml_file)
  end
end
