class ProcessXmlFileService
  def initialize(xml_data, document_id)
    @xml_data = xml_data
    @document_id = document_id
  end

  def call
    parsed_xml = Nokogiri::XML(@xml_data)
    report = Report.new

    infNFe = parsed_xml.css('infNFe')

    infNFe.css('ide').each do |ide|
      total = infNFe.css('total')
      report.serie = ide.css('serie').text
      report.n_nf = ide.css('nNF').text
      report.dh_emi = DateTime.parse(ide.css('dhEmi').text)
      report.products_total_value = total.css('vProd').text.to_f
      report.icms_total = total.css('vICMS').text.to_f
      report.ipi_total = total.css('vIPI').text.to_f
      report.pis_total = total.css('vPIS').text.to_f
      report.cofins_total = total.css('vCOFINS').text.to_f
    end

    report.document_id = @document_id
    report.save

    report.create_emitente(emit_params(infNFe.css('emit')))
    report.create_destinatario(dest_params(infNFe.css('dest')))

    infNFe.css('det').each do |det|
      product = product_params(det)
      report.products.create(product)
    end
  end

  private

  def emit_params(emit)
    {
      cnpj: emit.css('CNPJ').text,
      name: emit.css('xNome').text,
      name_fant: emit.css('xFant').text,
      address: mount_emit_address(emit),
      fone: emit.css('fone').text
    }
  end

  def dest_params(dest)
    {
      cnpj: dest.css('CNPJ').text,
      name: dest.css('xNome').text,
      address: mount_dest_address(dest),
    }
  end

  def product_params(det)
    {
      name_prod: det.css('xProd').text,
      ncm: det.css('NCM').text,
      cfop: det.css('CFOP').text,
      u_com: det.css('uCom').text,
      q_com: det.css('qCom').text.to_f,
      value_un_com: det.css('vUnCom').text.to_f,
      value_icms: det.css('vICMS').text.to_f,
      value_ipi: det.css('vIPI').text.to_f,
      value_pis: det.css('vPIS').text.to_f,
      value_cofins: det.css('vCOFINS').text.to_f
    }
  end

  def mount_emit_address(emit)
    ender_emit = emit.css('enderEmit')
    address_parts = [
      ender_emit.css('xLgr').text,
      ender_emit.css('nro').text,
      ender_emit.css('xCpl').text,
      ender_emit.css('xBairro').text,
      ender_emit.css('xMun').text,
      ender_emit.css('UF').text,
      "CEP: #{ender_emit.css('CEP').text}",
      ender_emit.css('xPais').text
    ]

    address_parts.reject(&:empty?).join(', ')
  end

  def mount_dest_address(dest)
    ender_dest = dest.css('enderDest')
    address_parts = [
      ender_dest.css('xLgr').text,
      ender_dest.css('nro').text,
      ender_dest.css('xBairro').text,
      ender_dest.css('xMun').text,
      ender_dest.css('UF').text,
      "CEP: #{ender_dest.css('CEP').text}",
      ender_dest.css('xPais').text
    ]

    address_parts.reject(&:empty?).join(', ')
  end
end
