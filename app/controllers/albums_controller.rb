class AlbumsController < ApplicationController
    def index
        if params.has_key?(:band_id)
            @albums = Album.where(band_id: params[:band_id])
        else
            @albums = Album.all
        end
    end
end
