class ReportsController < ApplicationController
  include ApplicationHelper

  before_action :require_login
  before_action :set_report, only: %i[show export_excel]

  def show; end

  def index
    @q = Report.includes(:document).where(documents: { user_id: current_user.id }).ransack(params[:q])
    @reports = @q.result.order(created_at: :desc)
  end

  def export_excel
    filename = "report_#{@report.document.filename}.xlsx"
    report = report_excel_presenter.excel_data
    headers = report_excel_presenter.headers

    xlsx = generate_excel(report, headers)

    send_data(xlsx.read_string, filename: filename)
  end

  private

  def generate_excel(data, headers)
    xlsx = FastExcel.open(constant_memory: true)

    worksheet = xlsx.add_worksheet('Relatório')
    worksheet.auto_width = true
    bold = xlsx.bold_format

    worksheet.append_row([I18n.t("reports.export_excel.sections.nf")], bold)
    worksheet.append_row(headers[:nf_headers], bold)
    worksheet.append_row(data[:nf].values)

    worksheet.append_row([I18n.t("reports.export_excel.sections.emitente")], bold)
    worksheet.append_row(headers[:emitente_headers], bold)
    worksheet.append_row(data[:emitente].values)

    worksheet.append_row([I18n.t("reports.export_excel.sections.destinatario")], bold)
    worksheet.append_row(headers[:destinatario_headers], bold)
    worksheet.append_row(data[:destinatario].values)

    worksheet.append_row([I18n.t("reports.export_excel.sections.products")], bold)
    worksheet.append_row(headers[:products_headers], bold)
    data[:products].each do |product|
      worksheet.append_row(product.values)
    end

    worksheet.append_row([I18n.t("reports.export_excel.sections.totals")], bold)
    worksheet.append_row(headers[:totals_headers], bold)
    worksheet.append_row(data[:totals].values)

    worksheet.close

    xlsx
  end

  def report_excel_presenter
    ReportExcelPresenter.new(@report)
  end

  def set_report
    @report = Report.find(params[:id])
  end
end
