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
require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
