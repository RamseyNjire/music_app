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

    def update
        @band = Band.find_by(id: params[:id])

        if @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            render json: @band.errors.full_messages
        end
    end

    def show
        @band = Band.find_by(id: params[:id])

        render :show
    end

    def destroy
        @band = Band.find_by(id: params[:id])

        @band.destroy

        redirect_to bands_url
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end
