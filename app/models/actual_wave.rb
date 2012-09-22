class ActualWave < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :trial

  attr_accessible :file

  has_attached_file :file, :path => "uploads/#{:id}-actual.:extension"
  validates_attrachment_presence :file, :content_type => 'audio/x-wav'

end
