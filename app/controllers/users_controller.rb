class UsersController < ApplicationController
  def index
  end

  def show
    @reports = current_user.reports.all 
  end
end
