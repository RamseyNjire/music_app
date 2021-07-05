# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  track_type :string           default("REGULAR"), not null
#  album_id   :bigint
#  band_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Track < ApplicationRecord
  TRACK_TYPE = ["REGULAR", "BONUS"]

  validates :title, presence: { message: "^Track must have a title" }
  validates :ord, presence: { message: "^Track must have a track number" }
  validates :track_type, inclusion: { in: TRACK_TYPE,
                                      message: "^Track type must be regular or bonus" }


  belongs_to :album
  belongs_to :band
  has_many :notes, dependent: :destroy
end
