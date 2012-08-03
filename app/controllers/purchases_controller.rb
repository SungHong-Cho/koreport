# -*- coding: utf-8 -*-
class PurchasesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    unless current_user.seller && current_user.seller.name == "koreport"
      flash[:error] = "관리자가 아닙니다."
      redirect_to root_path
    else
      @purchases = Purchase.all
    end
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

    

    # bucket destroy.
    current_user.buckets.where(bucket_item_type: "Report", bucket_item_id: params[:reports]).destroy_all
    current_user.buckets.where(bucket_item_type: "Package", bucket_item_id: params[:packages]).destroy_all

    redirect_to order_complete_purchases_path(purchases: @purchases)
  end

  def new
    @report_id = params[:reports_id]
    @reports = Report.find_all_by_id(@report_id)
  end

  def order
    @reports = Report.find_all_by_id(params[:report_item_ids])
    @packages = Package.find_all_by_id(params[:package_item_ids])

    @total_original_price = 0
    @total_discount = 0
    @total_price = 0
    
    @reports.each do |report|
      @total_price += report.grade_price
    end

    @total_original_price = @total_price
    
    @packages.each do |package|
      @total_original_price += package.original_price
      @total_discount += package.discount
      @total_price += package.price
    end

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
@total_original_price = 0
    @total_discount = 0
    @total_price = 0
    
    @reports.each do |report|
      @total_price += report.grade_price
    end

    @total_original_price = @total_price
    
    @packages.each do |package|
      @total_original_price += package.original_price
      @total_discount += package.discount
      @total_price += package.price
    end
  end

  def update
    unless current_user.seller && current_user.seller.name == "koreport"
      redirect_to new_user_session_path
    else
      purchase = Purchase.find(params[:id])
      purchase.isPaid = true

      flash[:error] = "사용자 결제 승인 오류." unless purchase.save
    end
    redirect_to purchases_path
  end    
end
