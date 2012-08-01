
class KoreportController < ApplicationController
  def index
  end

  def search
    #if params[:search].blank?
      #redirect_to root_path
    #else
    @packages = Package.search(params[:search])
    @reports = Report.search(params[:search])
  end
end
