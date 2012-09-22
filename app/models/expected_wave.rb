# == Schema Information
#
# Table name: expected_waves
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExpectedWave < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :trial

  attr_accessible :file
  has_attached_file :file, :path => "uploads/#{:id}-expected.:extension"
  validates_attachment_presence :file, :content_type => 'audio/x-wav'

end
