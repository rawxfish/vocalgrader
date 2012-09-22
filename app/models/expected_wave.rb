# == Schema Information
#
# Table name: expected_waves
#
#  id                :integer          not null, primary key
#  trial_id          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class ExpectedWave < ActiveRecord::Base
  attr_accessible :user_id, :trial_id
  belongs_to :trial

  attr_accessible :file
  has_attached_file :file, :path => "uploads/#{:id}-expected.:extension"
  validates_attachment_presence :file, :content_type => 'audio/x-wav'

end
