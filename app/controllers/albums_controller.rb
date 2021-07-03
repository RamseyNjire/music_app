class AlbumsController < ApplicationController
    def index
        if params.has_key?(:band_id)
            @band = Band.find_by(id: params[:band_id])
            @albums = Album.where(band_id: params[:band_id])
        else
            @albums = Album.all
        end
    end

    def new
        @album = Album.new
        @band = Band.find_by(id: params[:band_id])
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url(@album)
        else
            render json: @album.errors.full_messages
        end
    end

    def show
        @album = Album.find_by(id: params[:id])
        @band = @album.band
    end

    def edit
        @album = Album.find_by(id: params[:id])
        @band = @album.band
    end

    def update
        @album = Album.find_by(id: params[:id])

        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            render json: @album.errors.full_messages
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        @band = @album.band
        @album.destroy

        redirect_to band_albums_url(@band)
    end


    private

    def album_params
        params.require(:album).permit(:title, :year, :album_type, :band_id)
    end
end
