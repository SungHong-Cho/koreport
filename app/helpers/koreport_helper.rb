module KoreportHelper
  def user_buckets_path(report)
    if user_signed_in?
      buckets_path(current_user, :report_id => report.id)
    else
      new_user_session_path
    end
  end
end
