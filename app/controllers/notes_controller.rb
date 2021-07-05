class NotesController < ApplicationController
    before_action :require_current_user!
    
    private

    def notes_params
        params.require(:note).permit(:track_id, :user_id, :text)
    end
end
