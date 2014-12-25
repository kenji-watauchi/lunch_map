class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @q        = Restaurant.search(params[:q])
    @restaurants = @q.result(distinct: true)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    params[:restaurant][:genres].each do |id|
      next if id == ""
      @restaurant.genres << Genre.find(id)
    end
      #write_attribute(:genre_ids, Restaurant.wrap(value).reject{|v| v.blank? }.map{|v| v.to_i})
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
    params.require(:restaurant).permit(:name, :phone, :address, :photo, :comment, :genres)
  end
end
