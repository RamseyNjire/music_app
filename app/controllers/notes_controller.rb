class NotesController < ApplicationController
    before_action :require_current_user!

    def index
        @track = Track.find_by(id: params[:track_id])
        @notes = Note.where(track_id: params[:track_id]).includes(:author)
    end
    
    private

    def notes_params
        params.require(:note).permit(:track_id, :user_id, :text)
    end
end
