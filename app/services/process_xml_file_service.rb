class ProcessXmlFileService
  def initialize(document)
    @document = document
  end

  def call
    if @document.xml_file.attached?
      xml_data = @document.xml_file.download
      parsed_xml = Nokogiri::XML(xml_data)

      infNFe = parsed_xml.css('infNFe')

      emit_name = infNFe.css('emit').css('xNome').text
      puts emit_name
    end
  end
end
