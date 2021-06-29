class Album < ApplicationRecord
  ALBUM_TYPE = ["LIVE", "STUDIO"]

  validates :title, presence: { message: "^Album must have a name" }
  validates :year, presence: { message: "^What year was this album published?" }
  # validates :album_type, inclusion: { in: }
  belongs_to :band
end
