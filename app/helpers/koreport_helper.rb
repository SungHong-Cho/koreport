module KoreportHelper
  def user_buckets_path(report)
    if user_signed_in?
      buckets_path(current_user, :report_id => report.id)
    else
      new_user_session_path
    end
  end

  def current_path?(controller = "koreport", action = "index")
    path_list = [[controller: "user", action: "show"], [controller: "koreport", action: "search"]]
    # current_path = [params[:controller], params[:action]]
    path_list.each do |path|
      if path[:controller] == controller.to_s && path[:action] == action.to_s
        return true;
      end
    end
    false
  end
end
