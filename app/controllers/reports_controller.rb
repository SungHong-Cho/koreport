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
    @report = Report.new
    15.times { @report.documents.build }
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

  def view
    @report = Report.find(params[:id])
    if user_signed_in? && current_user.buy_this?(@report)
      @img_list = @report.documents.collect { |document| document.doc_img }
      @images = @img_list     
      gon.firstImage = @images.first.url
    else
      redirect_to new_session_path
    end
  end

  def print
     @report = Report.find(params[:id])
     @img_list = @report.documents.collect { |document| document.doc_img }
     @images = @img_list;
  end
end
