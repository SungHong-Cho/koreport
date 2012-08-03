class BucketsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @report_buckets = current_user.buckets.where(bucket_item_type: "Report").all
    @package_buckets = current_user.buckets.where(bucket_item_type: "Package").all

    @report_ids = @report_buckets.collect { |bucket| bucket.bucket_item_id }
    @package_ids = @package_buckets.collect { |bucket| bucket.bucket_item_id }

    @reports = Report.find_by_id(@report_ids)
    @packages = Package.find_by_id(@package_ids)
    
    # @reports_id = @reports.collect {|report| report.id} if @reports.any?
  end
  
  def create
      current_user.buckets.create(bucket_item_type: params[:bucket_item_type], bucket_item_id: params[:bucket_item_id])
      redirect_to buckets_path(current_user)
  end

  def destroy
      @buckets = current_user.buckets
      @buckets.where(bucket_item_id: params[:item_ids], bucket_item_type: params[:item_type]).destroy_all
      redirect_to buckets_path(current_user)
  end
end
