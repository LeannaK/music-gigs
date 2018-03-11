class BandsController < ApplicationController
  before_action :find_band, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.user = current_user
    if @band.save
      redirect_to @band, notice: 'Band added.'
    else
      redirect_to bands_path, notice: 'Unable to add band.'
    end
  end

  def show
  end

  def edit
    if @band.user != current_user
      redirect_to @band, notice: 'You can only make edits to your own pages.'
    end
  end

  def update
    if @band.user != current_user
      redirect_to @band, notice: 'You can only make edits to your own pages.'
    end
    if @band.update(band_params)
      redirect_to @band, notice: 'Band updated.'
    else
      redirect_to @band, notice: 'Unable to update band.'
    end
  end

  def destroy
    if @band.user != current_user
      redirect_to @band, notice: 'You can only make edits to your own pages.'
    end
    @band.destroy
    redirect_to bands_path
  end

  private

  def band_params
    params.require(:band).permit(:name, :genre, :location, :poc, :phone, :email, :details, :link)
  end

  def find_band
    @band = Band.find(params[:id])
  end
end