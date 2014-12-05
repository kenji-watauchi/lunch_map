class RestaurantsController < ApplicationController

  def index
@restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "登録完了！"
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
        @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = "Profile updated"
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :phone, :address)
  end
end

