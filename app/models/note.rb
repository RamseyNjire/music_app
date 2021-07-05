class Note < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :track
  belongs_to :user
end
