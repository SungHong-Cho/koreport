
class PurchasesController < ApplicationController
  def index
  end

  def create
    
  end

  def new
    @report_id = params[:reports_id]
    @reports = Report.find_all_by_id(@report_id)
  end

  def order
    @reports = Report.find_all_by_id(params[:reports])
    @packages = Package.find_all_by_id(params[:packages])
  end

  def order_complete
    @purchases = params[:purchases]
  end
end
