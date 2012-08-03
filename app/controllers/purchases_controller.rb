# -*- coding: utf-8 -*-
class PurchasesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def create
    @reports = Report.find_all_by_id(params[:reports])
    @packages = Package.find_all_by_id(params[:packages])
    @purchases = Array.new
    
    @reports.each do |report|
      @purchases << report.purchases.create(user_id: current_user.id)
    end
    
    @packages.each do |package|
      @purchases << package.purchases.create(user_id: current_user.id)
    end

    current_user.attributes = params[:user]
    current_user.save(validate: false)

   redirect_to order_complete_purchases_path(purchases: @purchases)
  end

  def new
    @report_id = params[:reports_id]
    @reports = Report.find_all_by_id(@report_id)
  end

  def order
    @reports = Report.find_all_by_id(params[:reports])
    @packages = Package.find_all_by_id(params[:packages])

    @sum_price = 0

    @reports.each { |report| @sum_price += report.grade_price } unless @reports.empty?
    @packages.each { |package| @sum_price += package.price } unless @packages.empty?

    @user = User.find(current_user.id)
  end

  def order_complete
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
    @packages = Package.find_all_by_id(@package_ids)

    @price_sum = 0

    @reports.each { |report| @price_sum += report.grade_price } unless @reports.empty?
    @packages.each { |report| @price_sum += package.price } unless @packages.empty?
  end
end
