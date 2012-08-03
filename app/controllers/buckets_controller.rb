# -*- coding: utf-8 -*-
class BucketsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @report_buckets = current_user.buckets.where(bucket_item_type: "Report")
    @package_buckets = current_user.buckets.where(bucket_item_type: "Package")

    @report_ids = @report_buckets.collect { |bucket| bucket.bucket_item_id }
    @package_ids = @package_buckets.collect { |bucket| bucket.bucket_item_id }

    @reports = Report.find_all_by_id(@report_ids)
    @packages = Package.find_all_by_id(@package_ids)
    
    logfile = File.open("/tmp/xxx", 'a')
    logfile << "index? #{params[:report_item_ids]}\n"
    logfile.close

    # @reports_id = @reports.collect {|report| report.id} if @reports.any?
  end
  
  def create
    @bucket = current_user.buckets.build(bucket_item_type: params[:bucket_item_type], bucket_item_id: params[:bucket_item_id])

    if @bucket.save
      redirect_to buckets_path(current_user)
    else
      flash[:error] = "장바구니를 이용할 수 없습니다. 코리포트에 문의하세요."
      redirect_to root_path
    end
  end

  def destroy
    logfile = File.open("/tmp/xxx", 'a')
    logfile << "destroy? #{params[:report_item_ids]}\n"
    logfile.close

    @buckets = current_user.buckets
 
    @buckets.where(bucket_item_type: 'Report', bucket_item_id: params[:report_item_ids]).destroy_all
    @buckets.where(bucket_item_type: 'Package', bucket_item_id: params[:package_item_ids]).destroy_all
    
    redirect_to buckets_path(current_user)
  end
end
