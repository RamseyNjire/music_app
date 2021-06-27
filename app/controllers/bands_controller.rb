class BandsController < ApplicationController
    def index
        @bands = Band.all

        render :index
    end

    def new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            render json: @band.errors.full_messages
        end
    end
    
    def edit
        @band = Band.find_by(id: params[:id])
    end


    def show
        @band = Band.find_by(id: params[:id])

        render :show
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end
