class Track < ApplicationRecord
  TRACK_TYPE = ["REGULAR", "BONUS"]

  validates :title, presence: { message: "^Track must have a title" }
  validates :ord, presence: { message: "^Track must have a track number" }
  validates :track_type, inclusion: { in: TRACK_TYPE,
                                      message: "^Track type must be regular or bonus" }


  belongs_to :album
  belongs_to :band
end
