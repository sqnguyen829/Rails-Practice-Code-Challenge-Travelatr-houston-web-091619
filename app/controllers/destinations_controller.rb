class DestinationsController < ApplicationController
  before_action :current_destination, only: [:show, :edit, :update, :destroy] 
  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
    @bloggers = Blogger.all
  end

  def edit
  end

  def show
  end

  def create
    @destination = Destination.create(destination_params)
    if @destination.valid?
      @destination.save
      redirect_to destination_path(@destination)
    else
      flash[:errors] = @destination.errors.full_messages
      redirect_to new_destination_path
    end
  end

  def update
    @destination.update(destination_params)
    if @destination.valid?
      @destination.save
      redirect_to destination_path(@destination)
    else
      flash[:errors] = @destination.errors.full_messages
      redirect_to edit_destination_path
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end
  
  private

  def current_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :country)
  end
end
