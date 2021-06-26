class BandsController < ApplicationController
    def index
        @bands = Band.all

        render json: @bands
    end
end
