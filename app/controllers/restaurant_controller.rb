class RestaurantController < ApplicationController

  def index

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
   @restaurant = Restaurant.new
  end
end
