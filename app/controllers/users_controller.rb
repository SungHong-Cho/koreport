class UsersController < ApplicationController
  def index
  end

  def show
    @reports = current_user.reports.all 
  end

  def bucket
    @buckets = current_user.buckets.all
    @report_ids = @buckets.collect {|bucket| bucket.report_id}
    @reports = Report.find(@report_ids)
  end

  def add_bucket
    if user_signed_in?
      current_user.buckets.create(report_id: params[:report_id])
      redirect_to bucket_user_path(current_user)
    else
      redirect_to new_user_session_path
    end
  end
end
