# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :string           not null
#  album_type :string           default("STUDIO"), not null
#  band_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  ALBUM_TYPE = ["LIVE", "STUDIO"]

  validates :title, presence: { message: "^Album must have a name" }
  validates :year, presence: { message: "^What year was this album published?" }
  validates :album_type, inclusion: { in: ALBUM_TYPE,
                                      message: "^Please specify the album type" }
  belongs_to :band
  has_many :tracks
end
