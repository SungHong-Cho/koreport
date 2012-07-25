
class KoreportController < ApplicationController
  def index
  end

  def search
    @report = Report.all
  end
end
