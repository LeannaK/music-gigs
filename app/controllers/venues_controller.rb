class VenuesController < ApplicationController
  before_action :find_venue, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to @venue, notice: 'Venue added.'
    else
      redirect_to venues_path, notice: 'Unable to add venue.'
    end
  end

  def show
  end

  def edit
    if @venue.user != current_user
      redirect_to @venue, notice: 'You can only make edits to your own pages.'
    end
  end

  def update
    if @venue.user != current_user
      redirect_to @venue, notice: 'You can only make edits to your own pages.'
    end
    if @venue.update(venue_params)
      redirect_to @venue, notice: 'Venue updated.'
    else
      redirect_to @venue, notice: 'Unable to update venue.'
    end
  end

  def destroy
    if @venue.user != current_user
      redirect_to @venue, notice: 'You can only make edits to your own pages.'
    end
    @venue.destroy
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :phone, :email, :poc, :description, :link)
  end

  def find_venue
    @venue = Venue.find(params[:id])
  end
end