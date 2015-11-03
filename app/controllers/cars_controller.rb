class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
  end
  def new
    @car = Car.new
  end
  def show
  end

  def edit
  end

  def create
   @cars = Car.new(car_params)
   respond_to do |format|
   if @cars.save
    format.html { redirect_to root_path,
      notice: "#{@cars.year} #{@cars.make} #{@cars.model} added to Database"
    }
   else
     # do something
     end
  end
end
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html {redirect_to root_path, notice: " #{@car.model}: ##{@car.id} Was successfully updated!" }
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: "#{@car.make} #{@car.model}: ##{@car.id} was destroyed."
      }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end
end
()
