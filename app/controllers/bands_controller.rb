class BandsController < ApplicationController
    def index
        @bands = Band.all

        render :index
    end

    def new
    end

    def show
        @band = Band.find_by(id: params[:id])

        render :show
    end
end
