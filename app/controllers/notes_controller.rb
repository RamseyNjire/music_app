class NotesController < ApplicationController
    before_action :require_current_user!

    def index
        @track = Track.find_by(id: params[:track_id])
        @notes = Note.where(track_id: params[:track_id]).includes(:author)
    end

    def create
        @note = Note.new(note_params)
        @track = Track.find_by(id: note_params[note:[:track_id])

        @note.save
        
        redirect_to track_notes_url(@track)
    end
    
    private

    def note_params
        params.require(:note).permit(:track_id, :user_id, :text)
    end
end
