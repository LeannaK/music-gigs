class GigsController < ApplicationController
  before_action :find_venue
  before_action :find_gig, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @gigs = @venue.gigs
  end

  def new
    if @venue.user != current_user
      redirect_to venue_gigs_path(@venue), notice: 'You can only make edits to your own pages.'
    end
    @gig = @venue.gigs.new
  end

  def create
    if @venue.user != current_user
      redirect_to venue_gigs_path(@venue), notice: 'You can only make edits to your own pages.'
    end
    @gig = @venue.gigs.create(gig_params)
    if @gig.save
      redirect_to venue_gig_path(@venue.id, @gig.id), notice: 'Gig added.'
    else
      redirect_to venue_gigs_path, notice: 'Unable to add gig.'
    end
  end

  def show
  end

  def edit
if @venue.user != current_user
      redirect_to venue_gig_path(@venue.id, @gig.id), notice: 'You can only make edits to your own pages.'
    end
  end

  def update
if @venue.user != current_user
      redirect_to venue_gig_path(@venue.id, @gig.id), notice: 'You can only make edits to your own pages.'
    end
    if @gig.update(gig_params)
      redirect_to venue_gig_path(@venue.id, @gig.id), notice: 'Gig updated.'
    else
      redirect_to venue_gig_path(@venue.id, @gig.id), notice: 'Unable to update gig.'
    end
  end

  def destroy
    if @venue.user != current_user
      redirect_to venue_gig_path(@venue.id, @gig.id), notice: 'You can only make edits to your own pages.'
    end
    @gig.destroy
    redirect_to venue_gigs_path
  end

  private

  def find_venue
    @venue = Venue.find(params[:venue_id])
  end

  def find_gig
    @gig = @venue.gigs.find(params[:id])
  end

  def gig_params
    params.require(:gig).permit(:name, :date, :time, :band, :cost, :description, :link)
  end
end