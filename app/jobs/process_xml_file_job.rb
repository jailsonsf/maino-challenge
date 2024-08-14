class ProcessXmlFileJob < ApplicationJob
  queue_as :default

  def perform(document)
    ProcessXmlFileService.new(document).call
  end
end
