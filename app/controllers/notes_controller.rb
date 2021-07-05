class NotesController < ApplicationController
    private
    
    def notes_params
        params.require(:note).permit(:track_id, :user_id, :text)
    end
end
