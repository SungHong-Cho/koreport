class UsersController < ApplicationController
  def index
    
  end

  def show
    if user_signed_in? && current_user.purchases.any?
      @purchases = current_user.purchases
      @report_ids = Array.new
      @package_ids = Array.new

      @purchases.each do |purchase|
        if purchase.item_type == "Report"
          @report_ids << purchase.item_id
        else
          @package_ids << purchase.item_id
        end
      end

      @reports = Report.find_all_by_id(@report_ids)
      @packages = Package.find_all_by_id(@package_ids)
      # @packages = Package.find_all_by_id()
      # @reports = Report.find_all_by_id(current_user.purchases.where(item_type: "Report").item_id)
    #else
     # @packages = @reports = nil
    #end
    end
  end
end
