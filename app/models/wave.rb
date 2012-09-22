# == Schema Information
#
# Table name: waves
#
#  id         :integer          not null, primary key
#  path       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wave < ActiveRecord::Base
	attr_accessible :path

	 has_many :trial_wave_edges, foreign_key: "wave_id", dependent: :destroy
  has_many :trials, :through => :trial_wave_edges, source: :trial

end
