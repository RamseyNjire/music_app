# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  text       :text             not null
#  track_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :track
  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
end
