class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(name: params[:name])

    if @sport.save
      redirect_to sports_path
    else
      render :new
    end
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])

    if @sport.update_attributes(sports_params)
      redirect_to sports_path
    else
      render :edit
    end
  end

  private

  def sports_params
    params.require(:sport).permit!
  end
end
