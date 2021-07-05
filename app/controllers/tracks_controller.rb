class TracksController < ApplicationController
  before_action :set_track, only: %i[ show edit update destroy ]

  # GET /tracks or /tracks.json
  def index
    @album = Album.find_by(id: params[:album_id])
    @tracks = Track.where(album_id: params[:album_id])
  end

  # GET /tracks/1 or /tracks/1.json
  def show
    @album = @track.album
  end

  # GET /tracks/new
  def new
    @track = Track.new
    @album = Album.find_by(id: params[:album_id])
    @band = @album.band
  end

  # GET /tracks/1/edit
  def edit
    @album = @track.album
    @band = @track.band
  end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)
    
    
    if @track.save
      redirect_to track_url(@track)
    else
      render json: @track.errors.full_messages
    end

  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render json: @track.errors.full_messages
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  # def destroy
  #   @track.destroy
  #   respond_to do |format|
  #     format.html { redirect_to tracks_url, notice: "Track was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def track_params
      params.require(:track).permit(:title, :ord, :lyrics, :album_id, :band_id)
    end
end
