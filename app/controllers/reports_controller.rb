class ReportsController < ApplicationController
  include ApplicationHelper

  before_action :require_login
  before_action :set_report, only: %i[show]

  def show; end

  def index
    @q = Report.includes(:document).where(documents: { user_id: current_user.id }).ransack(params[:q])
    @reports = @q.result.order(created_at: :desc)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end
