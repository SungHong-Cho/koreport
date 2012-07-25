
class PurchasesController < ApplicationController
  def index
  end

  def create
  end

  def new
    @reports = Report.all
  end
end
