class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
    # no need for app/views/restaurants/create.html.erb
    # redirect_to restaurant_path(@restaurant)
  end

  # def edit
  #   @vehicle = Vehicle.find(params[:id])
  # end

  # def update
  #   @vehicle = Vehicle.find(params[:id])
  #   @vehicle.update(task_params)

  #   # no need for app/views/vehicle/update.html.erb
  #   redirect_to vehicle_index_path(@vehicle)
  #   # Will raise ActiveModel::ForbiddenAttributesError
  # end

  private

  def vehicle_params
    params.require(:vehicle).permit(:title, :category, :precio, :description)
  end
end
