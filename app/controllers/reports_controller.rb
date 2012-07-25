
class ReportsController < ApplicationController
  def index
  end

  def create
    @report = current_user.reports.build(params[:report])

    if @report.save
      redirect_to report_path(@report)

    else
      redirect_to root_path
    end
  end

  def new
  end

  def edit
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
