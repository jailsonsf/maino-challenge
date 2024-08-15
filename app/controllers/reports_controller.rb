class ReportsController < ApplicationController
  before_action :set_report, only: %i[show]

  def show; end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end
