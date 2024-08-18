class ReportExcelPresenter
  def initialize(report)
    @report = report
  end

  def excel_data
    {
      nf: {
        serie: @report[:serie],
        n_nf: @report[:n_nf],
        dh_emi: @report[:dh_emi]
      },
      emitente: {
        cnpj: @report.emitente[:cnpj],
        name: @report.emitente[:name],
        name_fant: @report.emitente[:name_fant],
        address: @report.emitente[:address],
        fone: @report.emitente[:fone],
      },
      destinatario: {
        cnpj: @report.destinatario[:cnpj],
        name: @report.destinatario[:name],
        address: @report.destinatario[:address],
      },
      products: mount_products(@report.products),
      totals: {
        products_total_value: @report[:products_total_value],
        icms_total: @report[:icms_total],
        ipi_total: @report[:ipi_total],
        pis_total: @report[:pis_total],
        cofins_total: @report[:cofins_total],
      }
    }
  end

  def headers
    nf_headers = %w[serie n_nf dh_emi]
    emitente_headers = %w[cnpj name name_fant address fone]
    destinatario_headers = %w[cnpj name address]
    products_headers = %w[name_prod ncm cfop u_com q_com value_un_com value_icms value_ipi value_pis value_cofins]
    totals_headers = %w[products_total_value icms_total ipi_total pis_total cofins_total]
    
    nf_headers_rows = nf_headers.map { |header| I18n.t("reports.export_excel.nf.#{header}") }
    emitente_headers_rows = emitente_headers.map { |header| I18n.t("reports.export_excel.emitente.#{header}") }
    destinatario_headers_rows = destinatario_headers.map { |header| I18n.t("reports.export_excel.destinatario.#{header}") }
    products_headers_rows = products_headers.map { |header| I18n.t("reports.export_excel.products.#{header}") }
    totals_headers_rows = totals_headers.map { |header| I18n.t("reports.export_excel.totals.#{header}") }

    {
      nf_headers: nf_headers_rows,
      emitente_headers: emitente_headers_rows,
      destinatario_headers: destinatario_headers_rows,
      products_headers: products_headers_rows,
      totals_headers: totals_headers_rows,
    }
  end

  private

  def mount_products(products)
    result = []
    products.each do |product|
      result << {
        name_prod: product[:name_prod],
        ncm: product[:ncm],
        cfop: product[:cfop],
        u_com: product[:u_com],
        q_com: product[:q_com],
        value_un_com: product[:value_un_com],
        value_icms: product[:value_icms],
        value_ipi: product[:value_ipi],
        value_pis: product[:value_pis],
        value_cofins: product[:value_cofins]
      }
    end

    result
  end
end
