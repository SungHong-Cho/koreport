module ApplicationHelper
  def current_path?(controller, action)
    controller == 'koreport' && action == 'search' unless controller.blank? || action.blank?
  end
end
