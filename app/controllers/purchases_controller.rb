
class PurchasesController < ApplicationController
  def index
  end

  def create
  end

  def new
    @report_id = params[:reports_id]
    @reports = Report.find_all_by_id(@report_id)
  end
end
