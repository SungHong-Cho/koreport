# -*- coding: utf-8 -*-
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
    @package = Package.new
    @packages = Package.all
  end

  def update
  end

  def destroy
  end

  def view
    @report = Report.find(params[:id])

    unless user_signed_in?
      redirect_to new_user_session_path
    end

    if current_user.freepass || current_user.buy_this?(@report)
      @img_list = @report.documents.collect { |document| document.doc_img }
      @images = @img_list     
      gon.firstImage = @images.first.url
    else
      flash[:error] = "결제 승인이 나지 않은 항목입니다."
      redirect_to user_path(current_user)
    end
  end

  def print
    @report = Report.find(params[:id])

    unless user_signed_in?
      redirect_to new_user_session_path
    end

    if current_user.freepass || current_user.buy_this?(@report)
      @img_list = @report.documents.collect { |document| document.doc_img }
      @images = @img_list     
    else
      flash[:error] = "결제 승인이 나지 않은 항목입니다."
      redirect_to user_path(current_user)
    end
  end
end
