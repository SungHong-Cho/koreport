
class PurchasesController < ApplicationController
  def index
  end

  def create
    if user_signed_in?
      @reports = Report.find_all_by_id(params[:reports])
      @packages = Package.find_all_by_id(params[:packages])
      @purchases = Array.new

      @reports.each do |report|
        @purchases << report.purchases.create(user_id: current_user.id)
      end

      @packages.each do |package|
        @purchases << package.purchases.create(user_id: current_user.id)
      end

      current_user.payer_name = params[:payer_name]
      current_user.bank = params[:bank]
      current_user.account = params[:account]
      current_user.tel = params[:tel]

      redirect_to order_complete_purchases_path(purchases: @purchases, user_id: current_user.id)
      
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @report_id = params[:reports_id]
    @reports = Report.find_all_by_id(@report_id)
  end

  def order
    @reports = Report.find_all_by_id(params[:reports])
    @packages = Package.find_all_by_id(params[:packages])
  end

  def order_complete
    @user = User.find(params[:user_id])
    @purchases = Purchase.find_all_by_id(params[:purchases])
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
    @packages = Report.find_all_by_id(@package_ids)

    @reports.each { |report| @price_sum += report.grade_price }
    @packages.each { |report| @price_sum += package.price }
  end
end
