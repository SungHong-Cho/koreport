module SessionsHelper
  def store_location
    user_session[:return_to] = request.fullpath
  end
end
