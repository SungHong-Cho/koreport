
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
    if user_signed_in? && not(current_user.seller.nil?)
      @packages = Package.all
      @package = @packages.first
    end
  end

  def update
  end

  def destroy
  end

  def view
     @report = Report.find(params[:id])
     @img_list = @report.documents.collect { |document| document.doc_img }
     
     gon.firstImage = @img_list.limit(1);
     gon.images = @img_list;
  end
end
