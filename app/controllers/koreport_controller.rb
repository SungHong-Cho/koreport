
class KoreportController < ApplicationController
  def index
  end

  def search
    @packages = Package.all
    @reports = Report.all
  end
end
