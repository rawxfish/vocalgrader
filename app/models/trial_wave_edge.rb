# == Schema Information
#
# Table name: trial_wave_edges
#
#  id         :integer          not null, primary key
#  trial_id   :integer
#  wave_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrialWaveEdge < ActiveRecord::Base
  attr_accessible :trial_id, :wave_id


  belongs_to :trial, class_name: "User"
  belongs_to :wave, class_name: "wave"
  
  validates :trial_id, presence: true
  validates :wave_id, presence: true
end
