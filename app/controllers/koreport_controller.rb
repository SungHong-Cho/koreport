# -*- coding: utf-8 -*-
class KoreportController < ApplicationController
  def index
  end

  def search
    #if params[:search].blank?
      #redirect_to root_path
    #else
    @packages = Package.search(params[:search])
    @reports = Report.search(params[:search])
    
    case params[:search]
    when '패키지'
      @category = '패키지'
    when '공모전'
      @category = '공모전'
    end
  end
end
