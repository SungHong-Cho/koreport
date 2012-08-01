class BucketsController < ApplicationController
  def index
    if user_signed_in?
      @report_items = current_user.bucket_reports.all
      # @reports_id = @reports.collect {|report| report.id} if @reports.any?
    else
      redirect_to new_user_session_path
    end
  end
  
  def create
    if user_signed_in?
      current_user.buckets.create(report_id: params[:report_id])
      redirect_to buckets_path(current_user)
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    if user_signed_in?
      @buckets = current_user.buckets
      @buckets.where(report_id: params[:item_ids]).destroy_all
      redirect_to buckets_path(current_user)
    else
      redirect_to new_user_session_path
    end
  end
end
