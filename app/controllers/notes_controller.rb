class NotesController < ApplicationController
    before_action :require_current_user!

    def create
        @note = Note.new(note_params)
        @track = Track.find_by(id: params[:note][:track_id])

        @note.save
        
        redirect_to track_url(@track)
    end

    def destroy
        @note = Note.find_by(id: params[:id])
        @track = @note.track

        if current_user == @note.author
            @note.destroy
            redirect_to track_url(@track)
        else
            render text: "You are not allowed to delete this note", status: :forbidden
        end
    end
    
    private

    def note_params
        params.require(:note).permit(:track_id, :user_id, :text)
    end
end
