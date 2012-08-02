class UsersController < ApplicationController
  def index
    
  end

  def show
    if user_signed_in? && current_user.purchases.any?
      @packages = Package.find_all_by_id(current_user.purchases.where(item_type: "Package"))
      @reports = Report.find_all_by_id(current_user.purchases.where(item_type: "Report"))
    else
      @packages = @reports = nil
    end
  end
end
