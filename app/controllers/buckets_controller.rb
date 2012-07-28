class BucketsController < ApplicationController
  def index
    if user_signed_in?
      @reports = current_user.bucket_reports.all
      @reports_id = @reports.collect {|report| report.id} if @reports.any?
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
  end
end
