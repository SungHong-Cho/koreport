
class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def create
    @package = Package.new(params[:package])

    if @package.save
      redirect_to packages_path

    else
      redirect_to new_package_path
    end
  end

  def new
  end

  def edit
    @package = Package.find(params[:id])
  end

  def show
    @package = Package.find(params[:id])
  end

  def update
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
  end
end
