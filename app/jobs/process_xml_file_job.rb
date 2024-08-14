class ProcessXmlFileJob < ApplicationJob
  queue_as :default

  def perform(document)
    puts document.xml_file.download
  end
end
