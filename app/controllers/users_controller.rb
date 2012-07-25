
class UsersController < ApplicationController
  def index
  end

  def show
    @reports = current_user.reports.all 
  end

  def bucket
    
  end

  def add_bucket
    if user_signed_in?
      Bucket.create(user_id: current_user.id, report_id: params[:report_id])
      redirect_to bucket_user_path(current_user)
    else
      redirect_to sign_in_path
    end
  end
end
