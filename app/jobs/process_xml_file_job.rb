class ProcessXmlFileJob < ApplicationJob
  queue_as :default

  def perform(xml_data, document_id)
    ProcessXmlFileService.new(xml_data, document_id).call
  end
end
