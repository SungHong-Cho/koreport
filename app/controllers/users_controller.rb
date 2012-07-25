
class UsersController < ApplicationController
  def index
  end

  def show
    @reports = current_user.reports.all 
  end

  def bucket
    @reports = current_user.bucket.reports.all
  end

  def add_bucket
    if user_signed_in? && current_user.id == params[:user_id]
      current_user.create_bucket(report_id: params[:report_id])
      redirect_to bucket_user_path(current_user)
    else
      redirect_to sign_in_path
    end
  end
end
